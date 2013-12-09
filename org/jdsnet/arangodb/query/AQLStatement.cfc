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
 * AQLStatement
 * 
 * @author jesse.shaffer
 * @date 12/7/13
 **/
component accessors=true output=false persistent=false {
	
	property string								Statement;
	property org.jdsnet.arangodb.model.Database	Database;
	property numeric							BatchSize;
	property boolean							ShowCount;
	property boolean							ShowFullCount;
	
	variables.boundParams = {};
	variables.batchSize = 0;
	variables.showCount=false;
	variables.showFullCount=false;
	
	/**
	 * Execute the statement.
	 * @boundParams A struct of named params to bind to the execution
	 */
	public Cursor function execute(struct boundParams=variables.boundParams) {
		return new Cursor(this.getDatabase(),this, arguments.boundParams);
	}
	
	/**
	 * Bind a named param to a value.
	 * @name Param name
	 * @value Param value
	 */
	public AQLStatement function bind(required string name, any value) {
		boundParams[name] = value;
		return this;
	}
	
}