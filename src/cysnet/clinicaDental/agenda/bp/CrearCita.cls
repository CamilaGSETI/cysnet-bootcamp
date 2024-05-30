/// 
Class cysnet.clinicaDental.agenda.bp.CrearCita Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='idPaciente' type='%Integer' instantiate='0' />
<property name='nombre' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='apellidos' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='email' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='idCita' type='%Integer' instantiate='0' />
<property name='descCita' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='fechaCita' type='%TimeStamp' instantiate='0' />
<property name='codEstado' type='%Integer' instantiate='0' />
<property name='exitoCita' type='%Boolean' instantiate='0' />
<property name='mensajeInfoPacienteCita' type='cysnet.clinicaDental.agenda.msg.struct.InfoCitaPaciente' instantiate='0' />
<property name='mensajeHL7' type='EnsLib.HL7.Message' instantiate='0' />
</context>
<sequence xend='200' yend='900' >
<call name='Crear cita' target='CitasSQL' async='0' xpos='200' ypos='250' >
<request type='cysnet.clinicaDental.agenda.msg.AltaCitaRequest' >
<assign property="callrequest.idPaciente" value="request.idPaciente" action="set" />
<assign property="callrequest.descCita" value="request.descCita" action="set" />
<assign property="callrequest.fechaCita" value="request.fechaCita" action="set" />
<assign property="callrequest.codEstado" value="request.codEstado" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.AltaCitaResponse' >
<assign property="context.exitoCita" value="callresponse.exito" action="set" />
<assign property="context.mensajeInfoPacienteCita.idCita" value="callresponse.lastID" action="set" />
</response>
</call>
<if name='Cita creada' condition='context.exitoCita = 1' xpos='200' ypos='350' xend='200' yend='800' >
<true>
<call name='Datos paciente' target='PacientesSQL' async='0' xpos='335' ypos='500' >
<request type='cysnet.clinicaDental.agenda.msg.BuscarPacienteRequest' >
<assign property="callrequest.id" value="request.idPaciente" action="set" />
</request>
<response type='cysnet.clinicaDental.agenda.msg.BuscarPacienteResponse' >
<assign property="context.mensajeInfoPacienteCita.nombre" value="callresponse.paciente.nombre" action="set" />
<assign property="context.mensajeInfoPacienteCita.apellidos" value="callresponse.paciente.apellidos" action="set" />
<assign property="context.mensajeInfoPacienteCita.email" value="callresponse.paciente.email" action="set" />
</response>
</call>
<transform name='Transformar a HL7' class='cysnet.clinicaDental.agenda.dtl.InfoCitaPacienteToSIU12' source='context.mensajeInfoPacienteCita' target='context.mensajeHL7' xpos='335' ypos='600' />
<call name='Enviar archivo' target='OutFileHL7' async='0' xpos='335' ypos='700' >
<request type='EnsLib.HL7.Message' />
<response type='EnsLib.HL7.Message' />
</call>
</true>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
