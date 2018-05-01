package com.myhostelmanager.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.myhostelmanager.form.LoginForm;

public class LoginValidator implements Validator {

	// @Autowired
	// private LoginService loginService;
	//
	// @Autowired
	// private LoginDao loginDao;

	Logger logger = Logger.getLogger(LoginValidator.class);

	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	public void validate(Object arg0, Errors errors) {

	}

	public void validateUser(LoginForm loginForm, Errors errors) {
		logger.info("Entered into Login validator");
		if (loginForm.getUid().isEmpty() || loginForm.getUid() == null) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "uid", "required.uid", "Enter UserName!");
		} else {
			Pattern pattern = Pattern.compile(
					"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
			Matcher matcher = pattern.matcher(loginForm.getUid());
			if (!matcher.matches()) {
				errors.rejectValue("uid", "uid.incorrect", "Enter Valid UserName");
			}
		}
		if (loginForm.getPwd().isEmpty() || loginForm.getPwd() == null) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required.pwd", "Enter Password!");
		}
		logger.info("Validation Completed.");
		// boolean b = loginService.isUserValid(loginForm.getUid(),
		// loginForm.getPwd());
		// if(!b){
		// errors.reject("status", "In valid User.");
		// }
		//
		// if((!loginForm.getUid().isEmpty() &&
		// loginForm.getUid()!=null)&&(!loginForm.getPwd().isEmpty() &&
		// loginForm.getPwd()!=null)){
		// System.out.println("Validator
		// id:"+loginForm.getUid()+"pswd:"+loginForm.getPwd());
		// List<Login> loginList = loginDao.getUser(loginForm.getUid(),
		// loginForm.getPwd());
		// System.out.println("Size:"+loginList.size());
		// Iterator itr = loginList.iterator();
		// while(itr.hasNext()){
		// LoginForm log=new LoginForm();
		// log=(LoginForm) itr.next();
		// if(loginForm.getUid().equals(log.getUid()) &&
		// loginForm.getPwd().equals(log.getPwd())){
		// }else{
		// errors.rejectValue("uid","uid.incorrect","Enter Valid Username and
		// Passowrd!");
		// }
		// }
		// }
	}
}
