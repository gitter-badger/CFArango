/*
 * The MIT License (MIT)
 * Copyright (c) 2013 Jesse Shaffer
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/**
 * BasicCredentials
 * 
 * @author jesse.shaffer
 * @date 12/1/13
 **/
component accessors=true output=false persistent=false implements=Credentials {
	property string username;
	property string password;
	
	this.setUsername("root");
	this.setPassword("");
	
	/**
	 * Constructor
	 **/
	public BasicCredentials function init(string username="root", string password="") {
		variables.username = arguments.username;
		variables.password = arguments.password;
		return this;
	}

	/**
	 * Interface method - binds credentials to the request object before sending.
	 **/
	public void function bind(required Http requestObject) {
		requestObject.setUsername(variables.username);
		requestObject.setPassword(variables.password);
	}
	
	package function getPassword() {
		if (!isNull(variables.password)) {
			return variables.password;
		}
	}

}