package com.angeltqs.crm.common.exception;

/*
 * 登录失败后抛出的异常
* <p>Title: LoginFailedException</p>  
* <p>Description: </p>  
* @author tqs
* @date 2020-11-5
 */
public class LoginFailedException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public LoginFailedException() {
		super();
	}

	public LoginFailedException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public LoginFailedException(String message, Throwable cause) {
		super(message, cause);
	}

	public LoginFailedException(String message) {
		super(message);
	}

	public LoginFailedException(Throwable cause) {
		super(cause);
	}
	
}
