package com.myhostelmanager.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myhostelmanager.form.LoginForm;
import com.myhostelmanager.form.NewTenantForm;
import com.myhostelmanager.model.Person;
import com.myhostelmanager.service.BlockService;
import com.myhostelmanager.service.LoginService;
import com.myhostelmanager.service.OperationsService;
import com.myhostelmanager.validator.LoginValidator;
import com.myhostelmanager.validator.NewTenantValidator;

@Controller
public class MainController {

	@Autowired
	private LoginService loginService;
	@Autowired
	private BlockService blockService;
	@Autowired
	private OperationsService operationsService;

	Logger logger = Logger.getLogger(MainController.class);

	/*-------------- Login ---------------*/
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	private ModelAndView index() {
		logger.info("Redirecting from Index page");
		return new ModelAndView("redirect:login.LoRe");
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	private ModelAndView showLoginForm(@ModelAttribute("loginForm") LoginForm loginForm, ModelMap model,
			HttpServletRequest request) {
		logger.info("Redirecting to Login page");
		model.addAttribute("loginForm");
		return new ModelAndView("login");
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	private ModelAndView Signin(@ModelAttribute("loginForm") LoginForm loginForm, BindingResult result,
			ModelMap model) {
		logger.info("Uid: " + loginForm.getUid() + " pwd: " + loginForm.getPwd());
		ModelAndView modelView = null;
		LoginValidator loginValidator = new LoginValidator();
		loginValidator.validateUser(loginForm, result);
		if (result.hasErrors()) {
			logger.info("Has Errors");
			modelView = new ModelAndView("login");
		} else {
			logger.info("before isUserValid");
			boolean b = loginService.isUserValid(loginForm.getUid(), loginForm.getPwd());
			if (b) {
				logger.info("Getting Hostel Id.");
				String hostelId = loginService.getHostelId(loginForm.getUid(), loginForm.getPwd());
				logger.info("Hostel Id: " + hostelId);
				model.addAttribute("hostelId", hostelId);
				logger.info("Getting Hostel Name.");
				model.addAttribute("hostelName", loginService.getHostelName(hostelId));
				logger.info("Getting Block Names");
				Map<String, String> blockNamesMap = blockService.getBlockIdNames(hostelId);
				model.addAttribute("BlockNames", blockNamesMap);
				if (blockNamesMap.size() == 1) {
					logger.info("Redirecting to Options page");
					modelView = new ModelAndView("options");
				} else {
					logger.info("Redirecting to BlockHome page");
					modelView = new ModelAndView("BlockHome");
				}
			} else {
				logger.info("In valid User");
				model.addAttribute("status", "In Valid User");
				modelView = new ModelAndView("login");
			}
		}
		return modelView;
	}

	/*------------------- Sign Up ------------------------*/

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	private String signUp() {
		logger.error("ERROR:User Navigated to Signup page");
		logger.fatal("FATAL:User Navigated to Signup page");
		return "signup";
	}

	/*-------------- Options ----------------------------*/

	@RequestMapping(value = "/options", method = RequestMethod.GET)
	private ModelAndView options(HttpServletRequest request, ModelMap model) {
		logger.info("Options method invoked.");
		String bId = request.getParameter("bId");
		String bName = request.getParameter("bName");
		logger.info("bId: " + bId + "and bName: " + bName);
		model.addAttribute("bId", bId);
		model.addAttribute("hostelName", bName);
		logger.info("Block Name:" + bName);
		return new ModelAndView("options");
	}

	/*--------------- New Tenant -------------------------*/
	@RequestMapping(value = "/addTenant", method = RequestMethod.GET)
	private ModelAndView newTenant(@ModelAttribute("newTenant") NewTenantForm newTenantForm, BindingResult result,
			ModelMap model, HttpServletRequest request) {
		logger.info("newTenant method invoked.");
		String bId = request.getParameter("bId");
		String bName = request.getParameter("bName");
		logger.info("bId: " + bId + "and bName: " + bName);
		model.addAttribute("bId", bId);
		model.addAttribute("hostelName", bName);
		List<String> roomNos = blockService.getRooms(bId);
		model.addAttribute("roomNos", roomNos);
		logger.info("Room Nos added to List.");
		logger.info("Redirecting to newTenant.");
		return new ModelAndView("newTenant");
	}

	@RequestMapping(value = "/addTenant", method = RequestMethod.POST)
	private ModelAndView saveTenant(@ModelAttribute("newTenant") NewTenantForm newTenantForm, BindingResult result,
			ModelMap model) {
		ModelAndView modelView = null;
		logger.info(newTenantForm.toString());
		model.addAttribute("bId", newTenantForm.getbId());
		model.addAttribute("hostelName", newTenantForm.getHostelName());
		List<String> roomNos = blockService.getRooms(newTenantForm.getbId());
		model.addAttribute("roomNos", roomNos);
		logger.info("Room Nos added to List.");
		logger.info("Redirecting to newTenant.");
		NewTenantValidator newTenantValidator = new NewTenantValidator();
		newTenantValidator.validateTenant(newTenantForm, result);
		if (result.hasErrors()) {
			logger.info("Has Erros");
			modelView = new ModelAndView("newTenant");
		} else {
			boolean personExist = operationsService.isPersonExist(newTenantForm);
			logger.info("Person existed checked.");
			if (personExist) {
				logger.info("Person already exist.");
				model.addAttribute("personStatus", "Already registered.");
				modelView = new ModelAndView("newTenant");
			} else {
				logger.info("Registering person.");
				Person person = operationsService.personFormToPerson(newTenantForm);
				operationsService.savePerson(person);
				model.addAttribute("personStatus", "Registration Succsessful.");
				newTenantForm = clearForm(newTenantForm);
				modelView = new ModelAndView("newTenant");
			}
		}
		return modelView;
	}

	/*--------------- View/Update Tenant -------------------------*/
	@RequestMapping(value = "/voruTenant", method = RequestMethod.GET)
	public ModelAndView viewOrUpdateTenant(HttpServletRequest request, ModelMap model) {
		logger.info("updateTenant GET method invoked.");
		String bId = request.getParameter("bId");
		String bName = request.getParameter("bName");
		logger.info("bId: " + bId + "and bName: " + bName);
		model.addAttribute("bId", bId);
		model.addAttribute("hostelName", bName);
		List<Person> allPersons = operationsService.getAllPersons(bId);
		model.addAttribute("all", allPersons);
		logger.info("Block Name:" + bName);
		return new ModelAndView("allTenants");
	}

	/*--------------update-------------------------------------*/
	@RequestMapping(value = "/updatePerson", method = RequestMethod.GET)
	public ModelAndView displayUpdateForm(HttpServletRequest request, ModelMap model) {
		logger.info("Redirecting to update Form");
		String pId = request.getParameter("pId");
		String bId = request.getParameter("bId");
		String bName = request.getParameter("bName");
		model.addAttribute("bId", bId);
		model.addAttribute("hostelName", bName);
		List person = operationsService.getPerson(pId);
		List<String> roomNos = blockService.getRooms(bId);
		model.addAttribute("roomNos", roomNos);
		logger.info("Room Nos added to List.");
		// model.addAttribute("tenant",person);
		return new ModelAndView("updateTenant", "updateTenant", setFormValues(person));
	}

	public NewTenantForm clearForm(NewTenantForm newTenantForm) {
		newTenantForm.setAddress(null);
		newTenantForm.setAmount(0);
		newTenantForm.setbId(null);
		newTenantForm.setDoj(null);
		newTenantForm.setEmail(null);
		newTenantForm.setHostelName(null);
		newTenantForm.setId(null);
		newTenantForm.setMobile(null);
		newTenantForm.setName(null);
		newTenantForm.setRoom(null);
		return newTenantForm;
	}

	public NewTenantForm setFormValues(List person) {
		NewTenantForm tenantForm = new NewTenantForm();
		Iterator<Person> itr = (Iterator<Person>) person.iterator();
		while (itr.hasNext()) {
			Person p = itr.next();
			tenantForm.setAddress(p.getAddress());
			tenantForm.setAmount(p.getAmount());
			tenantForm.setbId(p.getbId());
			tenantForm.setDoj(p.getDoj().toString());
			if(p.getDov() != null)
			tenantForm.setDov(p.getDov().toString());
			tenantForm.setEmail(p.getEmail());
			tenantForm.setHostelName(p.getbId());
			tenantForm.setId(p.getId());
			tenantForm.setMobile(p.getMobile());
			tenantForm.setName(p.getName());
			tenantForm.setRoom(p.getRoom());
		}
		return tenantForm;
	}

}
