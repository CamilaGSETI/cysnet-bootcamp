Class cysnet.clinicaDental.agenda.msg.struct.InfoCitaPaciente Extends (%SerialObject, %XML.Adaptor)
{

Property idCita As %Integer;

Property idPaciente As %Integer;

Property nombre As %String;

Property apellidos As %String;

Property email As %String;

Property descCita As %String(MAXLEN = "");

Property fechaCita As %TimeStamp;

Property codEstado As %Integer;

Storage Default
{
<Data name="InfoCitaPacienteState">
<Value name="1">
<Value>idCita</Value>
</Value>
<Value name="2">
<Value>idPaciente</Value>
</Value>
<Value name="3">
<Value>nombre</Value>
</Value>
<Value name="4">
<Value>apellidos</Value>
</Value>
<Value name="5">
<Value>email</Value>
</Value>
<Value name="6">
<Value>descCita</Value>
</Value>
<Value name="7">
<Value>fechaCita</Value>
</Value>
<Value name="8">
<Value>codEstado</Value>
</Value>
</Data>
<State>InfoCitaPacienteState</State>
<StreamLocation>^cysnet.clin8AF.InfoCitaPacD361S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
