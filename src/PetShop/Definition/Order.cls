Class PetShop.Definition.Order Extends (%JSON.Adaptor, %RegisteredObject) [ Inheritance = right, Not ProcedureBlock ]
{

Property complete As %Boolean;

Property id As %Integer;

Property petId As %Integer;

Property quantity As %Integer;

Property shipDate As %VarString;

Property status As %VarString(VALUELIST = ",placed,approved,delivered");

}
