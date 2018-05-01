package com.myhostelmanager.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.myhostelmanager.form.NewTenantForm;

public class NewTenantValidator implements Validator {

	Logger logger = Logger.getLogger(NewTenantValidator.class);

	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub

	}

	public void validateTenant(NewTenantForm newTenantForm, Errors errors) {
		logger.info("Entered into Login validator");
		if (newTenantForm.getName().isEmpty() || newTenantForm.getName() == null) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.name", "Please Enter Name.");
		} else {
			Pattern pattern = Pattern.compile("\\p{L}+(?: \\p{L}+)*$");
			Matcher matcher = pattern.matcher(newTenantForm.getName());
			if (!matcher.matches()) {
				errors.rejectValue("name", "name.incorrect", "Please Enter Valid Name");
			}
		}
		logger.info("Name field Validated");

		if (newTenantForm.getMobile().isEmpty() || newTenantForm.getMobile() == null) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mobile", "required.mobile",
					"Please Enter Mobile Number.");
		} else {
			if (!(newTenantForm.getMobile().matches("\\d{10}"))) {
				errors.rejectValue("mobile", "mobile.incorrect", "Please enter valid Mobile Number.");
			}
		}

		if (!(newTenantForm.getName().isEmpty() || newTenantForm.getName() == null)) {
			Pattern pattern = Pattern.compile(
					"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
			Matcher matcher = pattern.matcher(newTenantForm.getEmail());
			if (!matcher.matches()) {
				errors.rejectValue("email", "email.incorrect", "Please Enter Valid Email Id.");
			}
		}
		logger.info("Email field Validated");

		if (newTenantForm.getId().isEmpty() || newTenantForm.getId() == null) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required.id", "Please Enter Gov. Id.");
			// }else{
			// Pattern
			// pattern=Pattern.compile("^[a-zA-Z0-9_]+(\\s+[a-zA-Z0-9_\\.+-]+)*$");
			// Matcher matcher=pattern.matcher(newTenantForm.getEmail());
			// if(!matcher.matches()){
			// errors.rejectValue("id", "id.incorrect","Please Enter Valid Gov.
			// Id.");
			// }
		}
		logger.info("Gov. Id field Validated");

		if (newTenantForm.getDoj().isEmpty() || newTenantForm.getDoj() == null) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "doj", "required.doj", "Please Enter Date of Join.");
		}
		logger.info("DOJ field Validated");

		if ("none".equals(newTenantForm.getRoom())) {
			errors.rejectValue("room", "required.room", "Please Select Room.");
		}
		logger.info("Room field Validated");
	}

}
