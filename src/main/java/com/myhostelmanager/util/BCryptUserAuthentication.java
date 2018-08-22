package com.myhostelmanager.util;

import org.mindrot.jbcrypt.BCrypt;

public class BCryptUserAuthentication {

	private static String encryptPassword(String txtPwd){
		return BCrypt.hashpw(txtPwd, BCrypt.gensalt());
	}
	
	public static boolean isPasswordMatched(String txtPwd, String hasedPwd){
		return BCrypt.checkpw(txtPwd, hasedPwd);
	}

	public static void main(String[] args) {
		//System.out.println(encryptPassword("kanthreddy"));
		System.out.println("Loki: " + isPasswordMatched("lokireddy", "$2a$10$YMffvySm7SnbreNtRskbhOyikDNxlfkRnGoJs18k0UE.m3E0FFoyq"));
		System.out.println("Kanth: " + isPasswordMatched("kanthreddy","$2a$10$hxmDhyKG4XeV.LHPe/WTZuCvp0iLvJZUrKpfZq2Uq6pEFILQopzVW"));
	}

}
