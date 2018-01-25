<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="16008000">
	<Property Name="varPersistentID:{92A3BB43-3D74-4857-97B2-EE379F0E7221}" Type="Ref">/My Computer/Shared_Variables.lvlib/STOP ALL</Property>
	<Property Name="varPersistentID:{B607E3DC-5EC1-42EB-B79D-9C0F3293382F}" Type="Ref">/My Computer/Shared_Variables.lvlib/Com_ Runnings</Property>
	<Property Name="varPersistentID:{BC223E38-88CE-4996-851F-E80DBCBFBEB6}" Type="Ref">/My Computer/Shared_Variables.lvlib/New_message_Alarm</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Abilities" Type="Folder">
			<Item Name="Fan_control.vi" Type="VI" URL="../SubVI/Fan_control.vi"/>
			<Item Name="Led Matrix Control.vi" Type="VI" URL="../SubVI/Led Matrix Control.vi"/>
		</Item>
		<Item Name="Communication functions" Type="Folder">
			<Item Name="Auto_send_to_MCU.vi" Type="VI" URL="../SubVI/Auto_send_to_MCU.vi"/>
			<Item Name="Byte_array_to_Com_standard.vi" Type="VI" URL="../SubVI/Byte_array_to_Com_standard.vi"/>
			<Item Name="Communication_Handler.vi" Type="VI" URL="../Typedef/Communication_Handler.vi"/>
			<Item Name="Configurate Serial Communication Settings.vi" Type="VI" URL="../Communication VI/Configurate Serial Communication Settings.vi"/>
			<Item Name="Configure Critical Levels.vi" Type="VI" URL="../Communication VI/Configure Critical Levels.vi"/>
			<Item Name="Data_In_assessment.vi" Type="VI" URL="../Typedef/Data_In_assessment.vi"/>
			<Item Name="Extract_DATA_ID_from_header.vi" Type="VI" URL="../SubVI/Extract_DATA_ID_from_header.vi"/>
			<Item Name="Extract_MCU_name_from_array.vi" Type="VI" URL="../Typedef/Extract_MCU_name_from_array.vi"/>
			<Item Name="Incomming Array Handler.vi" Type="VI" URL="../SubVI/Incomming Array Handler.vi"/>
			<Item Name="Que.-Read.vi" Type="VI" URL="../SubVI/Que.-Read.vi"/>
			<Item Name="Que.-startvalue for MCU-com.vi" Type="VI" URL="../SubVI/Que.-startvalue for MCU-com.vi"/>
			<Item Name="Que.-startvalue for Serial Input.vi" Type="VI" URL="../SubVI/Que.-startvalue for Serial Input.vi"/>
			<Item Name="Raw_input_to_sorted.vi" Type="VI" URL="../SubVI/Raw_input_to_sorted.vi"/>
			<Item Name="Send_string_to_MCU.vi" Type="VI" URL="../SubVI/Send_string_to_MCU.vi"/>
			<Item Name="Send_to_MCU.vi" Type="VI" URL="../SubVI/Send_to_MCU.vi"/>
			<Item Name="Serian_Sorteddata_out.vi" Type="VI" URL="../Serian_Sorteddata_out.vi"/>
		</Item>
		<Item Name="Funksjons SubVI" Type="Folder">
			<Item Name="Average_array.vi" Type="VI" URL="../SubVI/Average_array.vi"/>
			<Item Name="Avrg_minute_hour_day.vi" Type="VI" URL="../SubVI/Avrg_minute_hour_day.vi"/>
			<Item Name="Derivering.vi" Type="VI" URL="../SubVI/Derivering.vi"/>
			<Item Name="Display_data.vi" Type="VI" URL="../SubVI/Display_data.vi"/>
			<Item Name="Integrate.vi" Type="VI" URL="../SubVI/Integrate.vi"/>
			<Item Name="Live_data_feed.vi" Type="VI" URL="../SubVI/Live_data_feed.vi"/>
		</Item>
		<Item Name="Mobile com" Type="Folder">
			<Item Name="BT_to_neon.vi" Type="VI" URL="../Communication VI/BT_to_neon.vi"/>
		</Item>
		<Item Name="Small" Type="Folder">
			<Item Name="test1.vi" Type="VI" URL="../SubVI/test1.vi"/>
			<Item Name="test2.vi" Type="VI" URL="../SubVI/test2.vi"/>
		</Item>
		<Item Name="Sub_VI" Type="Folder">
			<Item Name="Read_and_plot_files.vi" Type="VI" URL="../SubVI/Read_and_plot_files.vi"/>
			<Item Name="Serial_read.vi" Type="VI" URL="../Serial_read.vi"/>
			<Item Name="Settings_page.vi" Type="VI" URL="../SubVI/Settings_page.vi"/>
		</Item>
		<Item Name="Typedef" Type="Folder">
			<Item Name="Data_ID.ctl" Type="VI" URL="../Typedef/Data_ID.ctl"/>
			<Item Name="MCU_addresses.ctl" Type="VI" URL="../Typedef/MCU_addresses.ctl"/>
			<Item Name="Message_info.ctl" Type="VI" URL="../Typedef/Message_info.ctl"/>
			<Item Name="Serial_config_cluster.ctl" Type="VI" URL="../Typedef/Serial_config_cluster.ctl"/>
			<Item Name="Type_of_message_to_MCU.ctl" Type="VI" URL="../Typedef/Type_of_message_to_MCU.ctl"/>
			<Item Name="Type_of_request.ctl" Type="VI" URL="../Typedef/Type_of_request.ctl"/>
		</Item>
		<Item Name="Main smart home.vi" Type="VI" URL="../Main smart home.vi"/>
		<Item Name="Shared_Variables.lvlib" Type="Library" URL="../Shared_Variables.lvlib"/>
		<Item Name="SubVI_blueprint.vi" Type="VI" URL="../SubVI/SubVI_blueprint.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
				<Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="LVStringsAndValuesArrayTypeDef_U16.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVStringsAndValuesArrayTypeDef_U16.ctl"/>
				<Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
				<Item Name="Read Delimited Spreadsheet (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet (DBL).vi"/>
				<Item Name="Read Delimited Spreadsheet (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet (I64).vi"/>
				<Item Name="Read Delimited Spreadsheet (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet (string).vi"/>
				<Item Name="Read Delimited Spreadsheet.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Delimited Spreadsheet.vi"/>
				<Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
				<Item Name="Read Lines From File (with error IO).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Lines From File (with error IO).vi"/>
				<Item Name="RGB to Color.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/RGB to Color.vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="Waveform Array To Dynamic.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Waveform Array To Dynamic.vi"/>
				<Item Name="Write Delimited Spreadsheet (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (DBL).vi"/>
				<Item Name="Write Delimited Spreadsheet (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (I64).vi"/>
				<Item Name="Write Delimited Spreadsheet (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (string).vi"/>
				<Item Name="Write Delimited Spreadsheet.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet.vi"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
			</Item>
			<Item Name="Serial - ASCII Characters.ctl" Type="VI" URL="/../../../../Program Files (x86)/National Instruments/LabVIEW 2016/examples/Instrument IO/Serial/support/Serial - ASCII Characters.ctl"/>
			<Item Name="Serial - Settings.ctl" Type="VI" URL="/../../../../Program Files (x86)/National Instruments/LabVIEW 2016/examples/Instrument IO/Serial/support/Serial - Settings.ctl"/>
			<Item Name="Serial - XON-XOFF Characters.ctl" Type="VI" URL="/../../../../Program Files (x86)/National Instruments/LabVIEW 2016/examples/Instrument IO/Serial/support/Serial - XON-XOFF Characters.ctl"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
