/// This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.<br/>
/// Business logic class defined by OpenAPI in PetShop.spec<br/>
/// Created Apr 6, 2020 13:54:05
Class PetShop.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// uploads an image<br/>
/// The method arguments hold values for:<br/>
///     petId, ID of pet to update<br/>
///     additionalMetadata, Additional data to pass to server<br/>
///     file, file to upload<br/>
ClassMethod uploadFile(petId As %Integer, additionalMetadata As %String, file As %Stream.Object) As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Add a new pet to the store<br/>
/// The method arguments hold values for:<br/>
///     body, Pet object that needs to be added to the store<br/>
ClassMethod addPet(body As %Stream.Object) As %Stream.Object
{
    //Verify payload confirmity against definition
	Set tPaylaod = ##class(PetShop.Definition.Pet).%New()
	Set tSC = tPaylaod.%JSONImport(body)
	If ($$$ISERR(tSC)) {
		Do ..%ReportRESTError(500,tSC,1) Quit ""
	}

    Quit ""
}

/// Update an existing pet<br/>
/// The method arguments hold values for:<br/>
///     body, Pet object that needs to be added to the store<br/>
ClassMethod updatePet(body As %Stream.Object) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Multiple status values can be provided with comma separated strings<br/>
/// The method arguments hold values for:<br/>
///     status, Status values that need to be considered for filter<br/>
ClassMethod findPetsByStatus(status As %ListOfDataTypes(ELEMENTTYPE="%String")) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.<br/>
/// The method arguments hold values for:<br/>
///     tags, Tags to filter by<br/>
ClassMethod findPetsByTags(tags As %ListOfDataTypes(ELEMENTTYPE="%String")) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Returns a single pet<br/>
/// The method arguments hold values for:<br/>
///     petId, ID of pet to return<br/>
ClassMethod getPetById(petId As %Integer) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Updates a pet in the store with form data<br/>
/// The method arguments hold values for:<br/>
///     petId, ID of pet that needs to be updated<br/>
///     name, Updated name of the pet<br/>
///     status, Updated status of the pet<br/>
ClassMethod updatePetWithForm(petId As %Integer, name As %String, status As %String) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Deletes a pet<br/>
/// The method arguments hold values for:<br/>
///     api_key<br/>
///     petId, Pet id to delete<br/>
ClassMethod deletePet(apikey As %String, petId As %Integer) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Place an order for a pet<br/>
/// The method arguments hold values for:<br/>
///     body, order placed for purchasing the pet<br/>
ClassMethod placeOrder(body As %DynamicObject) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// For valid response try integer IDs with value >= 1 and <= 10. Other values will generated exceptions<br/>
/// The method arguments hold values for:<br/>
///     orderId, ID of pet that needs to be fetched<br/>
ClassMethod getOrderById(orderId As %Integer) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// For valid response try integer IDs with positive integer value. Negative or non-integer values will generate API errors<br/>
/// The method arguments hold values for:<br/>
///     orderId, ID of the order that needs to be deleted<br/>
ClassMethod deleteOrder(orderId As %Integer) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Returns a map of status codes to quantities
ClassMethod getInventory() As %DynamicObject
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Creates list of users with given input array<br/>
/// The method arguments hold values for:<br/>
///     body, List of user object<br/>
ClassMethod createUsersWithArrayInput(body As %DynamicArray) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Creates list of users with given input array<br/>
/// The method arguments hold values for:<br/>
///     body, List of user object<br/>
ClassMethod createUsersWithListInput(body As %DynamicArray) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Get user by user name<br/>
/// The method arguments hold values for:<br/>
///     username, The name that needs to be fetched. Use user1 for testing.<br/>
ClassMethod getUserByName(username As %String) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// This can only be done by the logged in user.<br/>
/// The method arguments hold values for:<br/>
///     username, name that need to be updated<br/>
///     body, Updated user object<br/>
ClassMethod updateUser(username As %String, body As %DynamicObject) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// This can only be done by the logged in user.<br/>
/// The method arguments hold values for:<br/>
///     username, The name that needs to be deleted<br/>
ClassMethod deleteUser(username As %String) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Logs user into the system<br/>
/// The method arguments hold values for:<br/>
///     username, The user name for login<br/>
///     password, The password for login in clear text<br/>
ClassMethod loginUser(username As %String, password As %String) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// Logs out current logged in user session
ClassMethod logoutUser() As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// This can only be done by the logged in user.<br/>
/// The method arguments hold values for:<br/>
///     body, Created user object<br/>
ClassMethod createUser(body As %DynamicObject) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

}
