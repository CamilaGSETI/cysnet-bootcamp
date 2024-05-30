Class cysnet.clinicaDental.agenda.bs.InSQLNotificaciones Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.SQL.InboundAdapter";

Method OnProcessInput(pInput As EnsLib.SQL.Snapshot, Output pOutput As %RegisteredObject) As %Status
{
    /* Lectura de la tabla Notificacion para IndEnviada = 0
    #dim req as cysnet.clinicaDental.agenda.msg.AdmitirPacienteRequest
    #dim rsp As cysnet.clinicaDental.agenda.msg.AdmitirPacienteResponse

    set req = ##class(cysnet.clinicaDental.agenda.msg.AdmitirPacienteRequest).%New()
    set req.idCita = pInput.Get("IdCita")
    set req.fechaAdmision = pInput.Get("FechaAdmision")

    // Falta poner el proceso al que va a ir ¿Proceso Pacientes?
    quit ..SendRequestSync("",req,.rsp)*/
}

}
