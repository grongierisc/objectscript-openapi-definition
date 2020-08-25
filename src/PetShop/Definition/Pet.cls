Class PetShop.Definition.Pet Extends (%JSON.Adaptor, %RegisteredObject) [ Inheritance = right, Not ProcedureBlock ]
{

Property category As Category;

Property id As %Integer;

Property name As %VarString [ Required ];

Property photoUrls As list Of %VarString [ Required ];

Property status As %VarString(VALUELIST = ",available,pending,sold");

Property tags As list Of Tag;

}
