#----------------------------------------------
#region Application Functions
#----------------------------------------------

#endregion Application Functions

#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Show-SMTP_Relay_Tool_V1_0_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formSMTPRelayTestingTool = New-Object 'System.Windows.Forms.Form'
	$groupbox1 = New-Object 'System.Windows.Forms.GroupBox'
	$buttonX = New-Object 'System.Windows.Forms.Button'
	$groupbox2 = New-Object 'System.Windows.Forms.GroupBox'
	$txt_Cc = New-Object 'System.Windows.Forms.TextBox'
	$labelCc = New-Object 'System.Windows.Forms.Label'
	$labelFrom = New-Object 'System.Windows.Forms.Label'
	$labelSubject = New-Object 'System.Windows.Forms.Label'
	$labelMessage = New-Object 'System.Windows.Forms.Label'
	$labelUser = New-Object 'System.Windows.Forms.Label'
	$labelSMTPServer = New-Object 'System.Windows.Forms.Label'
	$txt_from = New-Object 'System.Windows.Forms.TextBox'
	$chkbox_UseSSL = New-Object 'System.Windows.Forms.CheckBox'
	$txt_Subject = New-Object 'System.Windows.Forms.TextBox'
	$txt_body = New-Object 'System.Windows.Forms.TextBox'
	$txt_to = New-Object 'System.Windows.Forms.TextBox'
	$labelTo = New-Object 'System.Windows.Forms.Label'
	$btn_SendEmail = New-Object 'System.Windows.Forms.Button'
	$txt_password = New-Object 'System.Windows.Forms.TextBox'
	$txt_user = New-Object 'System.Windows.Forms.TextBox'
	$txt_Port = New-Object 'System.Windows.Forms.TextBox'
	$txt_Server = New-Object 'System.Windows.Forms.TextBox'
	$labelPassword = New-Object 'System.Windows.Forms.Label'
	$labelPort = New-Object 'System.Windows.Forms.Label'
	$labelSMTPRelayAppV10 = New-Object 'System.Windows.Forms.Label'
	$openfiledialog1 = New-Object 'System.Windows.Forms.OpenFileDialog'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$btn_SendEmail_Click = {
		#TODO: Place custom script here
		$Server = $txt_Server.Text
		$Port = $txt_Port.Text
		$From = $txt_from.Text
		$To = $txt_to.Text
		$Cc = $txt_Cc.Text
		$Subject = $txt_Subject.Text
		$Body = $txt_body.Text
		
		
		if ($chkbox_UseSSL.Checked -eq $true)
		{
			$Username = $txt_user.Text
			$Password = ConvertTo-SecureString $txt_Password.Text -AsPlainText -Force
			$LiveCred = New-Object System.Management.Automation.PSCredential $Username, $Password
			
			if ($txt_Cc.Text -eq "")
			{
				Try
				{
					Send-MailMessage -To $To -From $From -Subject $subject -Body $Body -SmtpServer $Server -port $port -Credential $LiveCred -UseSsl -ErrorAction Stop
					[void][system.windows.Forms.MessageBox]::Show("Email Sent Successfully", "Output", 'OK', 'Information')
				}
				Catch { [System.Windows.Forms.MessageBox]::Show("$Error", 'Error Message', 'OK', 'Error') }
				
			}
			
			if ($txt_Cc.Text -ne "")
			{
				Try
				{
					Send-MailMessage -To $To -Cc $Cc -From $From -Subject $subject -Body $Body -SmtpServer $Server -port $port -Credential $LiveCred -UseSsl -ErrorAction Stop
					[void][system.windows.Forms.MessageBox]::Show("Email Sent Successfully", "Output", 'OK', 'Information')
				}
				Catch { [System.Windows.Forms.MessageBox]::Show("$Error", 'Error Message', 'OK', 'Error') }
			}
		}
		
		if ($chkbox_UseSSL.Checked -eq $false)
		{
			if ($txt_Cc.Text -eq "")
			{
				Try
				{
					Send-MailMessage -To $To -From $From -Subject $Subject -Body $Body -SmtpServer $Server -port $Port -ErrorAction Stop
					[void][system.windows.Forms.MessageBox]::Show("Email Sent Successfully", "output", 'OK', 'Information')
				}
				Catch { [System.Windows.Forms.MessageBox]::Show("$Error", 'Error Message', 'OK', 'Error') }
			}
			
			if ($txt_Cc.Text -ne "")
			{
				Try
				{
					Send-MailMessage -To $To -From $From -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $Server -port $Port -ErrorAction Stop
					[void][system.windows.Forms.MessageBox]::Show("Email Sent Successfully", "output", 'OK', 'Information')
				}
				Catch { [System.Windows.Forms.MessageBox]::Show("$Error", 'Error Message', 'OK', 'Error') }
			}
		}
		
	}
	
	
	$buttonX_Click={
		#TODO: Place custom script here
		$formSMTPRelayTestingTool.Close()
	}
	
	$chkbox_UseSSL_CheckedChanged={
		#TODO: Place custom script here
		if ($chkbox_UseSSL.Checked -eq $true)
		{
			$labelUser.Enabled = $true
			$labelPassword.Enabled = $true
			$txt_user.Enabled = $true
			$txt_password.Enabled = $true
			$txt_Port.Text = "587"
		}
		else
		{
			$labelUser.Enabled = $false
			$labelPassword.Enabled = $false
			$txt_user.Enabled = $false
			$txt_password.Enabled = $false
			$txt_Port.Text = "25"
			
		}
	}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$formSMTPRelayTestingTool.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonX.remove_Click($buttonX_Click)
			$chkbox_UseSSL.remove_CheckedChanged($chkbox_UseSSL_CheckedChanged)
			$btn_SendEmail.remove_Click($btn_SendEmail_Click)
			$formSMTPRelayTestingTool.remove_Load($Form_StateCorrection_Load)
			$formSMTPRelayTestingTool.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$formSMTPRelayTestingTool.SuspendLayout()
	$groupbox1.SuspendLayout()
	$groupbox2.SuspendLayout()
	#
	# formSMTPRelayTestingTool
	#
	$formSMTPRelayTestingTool.Controls.Add($groupbox1)
	$formSMTPRelayTestingTool.AutoScaleDimensions = '6, 13'
	$formSMTPRelayTestingTool.AutoScaleMode = 'Font'
	$formSMTPRelayTestingTool.BackColor = 'ControlDarkDark'
	$formSMTPRelayTestingTool.ClientSize = '380, 598'
	$formSMTPRelayTestingTool.ForeColor = 'ButtonHighlight'
	$formSMTPRelayTestingTool.FormBorderStyle = 'None'
	$formSMTPRelayTestingTool.MaximizeBox = $False
	$formSMTPRelayTestingTool.Name = 'formSMTPRelayTestingTool'
	$formSMTPRelayTestingTool.ShowIcon = $False
	$formSMTPRelayTestingTool.StartPosition = 'CenterScreen'
	#
	# groupbox1
	#
	$groupbox1.Controls.Add($buttonX)
	$groupbox1.Controls.Add($groupbox2)
	$groupbox1.Controls.Add($labelSMTPRelayAppV10)
	$groupbox1.BackColor = 'WindowFrame'
	$groupbox1.Font = 'Microsoft Sans Serif, 13pt'
	$groupbox1.ForeColor = 'White'
	$groupbox1.Location = '4, -4'
	$groupbox1.Name = 'groupbox1'
	$groupbox1.Size = '371, 597'
	$groupbox1.TabIndex = 1
	$groupbox1.TabStop = $False
	$groupbox1.UseCompatibleTextRendering = $True
	#
	# buttonX
	#
	$buttonX.FlatStyle = 'Popup'
	$buttonX.ForeColor = 'White'
	$buttonX.Location = '344, 17'
	$buttonX.Name = 'buttonX'
	$buttonX.Size = '21, 21'
	$buttonX.TabIndex = 24
	$buttonX.Text = 'X'
	$buttonX.UseCompatibleTextRendering = $True
	$buttonX.UseVisualStyleBackColor = $True
	$buttonX.add_Click($buttonX_Click)
	#
	# groupbox2
	#
	$groupbox2.Controls.Add($txt_Cc)
	$groupbox2.Controls.Add($labelCc)
	$groupbox2.Controls.Add($labelFrom)
	$groupbox2.Controls.Add($labelSubject)
	$groupbox2.Controls.Add($labelMessage)
	$groupbox2.Controls.Add($labelUser)
	$groupbox2.Controls.Add($labelSMTPServer)
	$groupbox2.Controls.Add($txt_from)
	$groupbox2.Controls.Add($chkbox_UseSSL)
	$groupbox2.Controls.Add($txt_Subject)
	$groupbox2.Controls.Add($txt_body)
	$groupbox2.Controls.Add($txt_to)
	$groupbox2.Controls.Add($labelTo)
	$groupbox2.Controls.Add($btn_SendEmail)
	$groupbox2.Controls.Add($txt_password)
	$groupbox2.Controls.Add($txt_user)
	$groupbox2.Controls.Add($txt_Port)
	$groupbox2.Controls.Add($txt_Server)
	$groupbox2.Controls.Add($labelPassword)
	$groupbox2.Controls.Add($labelPort)
	$groupbox2.Location = '8, 44'
	$groupbox2.Name = 'groupbox2'
	$groupbox2.Size = '354, 523'
	$groupbox2.TabIndex = 23
	$groupbox2.TabStop = $False
	$groupbox2.UseCompatibleTextRendering = $True
	#
	# txt_Cc
	#
	$txt_Cc.Font = 'Microsoft Sans Serif, 8.25pt'
	$txt_Cc.Location = '52, 124'
	$txt_Cc.Name = 'txt_Cc'
	$txt_Cc.Size = '290, 20'
	$txt_Cc.TabIndex = 5
	#
	# labelCc
	#
	$labelCc.AutoSize = $True
	$labelCc.Font = 'Microsoft Sans Serif, 8.5pt, style=Bold'
	$labelCc.ForeColor = 'White'
	$labelCc.Location = '26, 127'
	$labelCc.Name = 'labelCc'
	$labelCc.Size = '22, 18'
	$labelCc.TabIndex = 40
	$labelCc.Text = 'Cc:'
	$labelCc.UseCompatibleTextRendering = $True
	#
	# labelFrom
	#
	$labelFrom.AutoSize = $True
	$labelFrom.Font = 'Microsoft Sans Serif, 8.5pt, style=Bold'
	$labelFrom.ForeColor = 'White'
	$labelFrom.Location = '12, 71'
	$labelFrom.Name = 'labelFrom'
	$labelFrom.Size = '36, 18'
	$labelFrom.TabIndex = 38
	$labelFrom.Text = 'From:'
	$labelFrom.UseCompatibleTextRendering = $True
	#
	# labelSubject
	#
	$labelSubject.AutoSize = $True
	$labelSubject.Font = 'Microsoft Sans Serif, 8.5pt, style=Bold'
	$labelSubject.ForeColor = 'White'
	$labelSubject.Location = '10, 156'
	$labelSubject.Name = 'labelSubject'
	$labelSubject.Size = '51, 18'
	$labelSubject.TabIndex = 36
	$labelSubject.Text = 'Subject: '
	$labelSubject.UseCompatibleTextRendering = $True
	#
	# labelMessage
	#
	$labelMessage.AutoSize = $True
	$labelMessage.BorderStyle = 'FixedSingle'
	$labelMessage.Font = 'Microsoft Sans Serif, 8.5pt, style=Bold'
	$labelMessage.ForeColor = 'White'
	$labelMessage.Location = '11, 203'
	$labelMessage.Name = 'labelMessage'
	$labelMessage.Size = '59, 21'
	$labelMessage.TabIndex = 34
	$labelMessage.Text = 'Message:'
	$labelMessage.UseCompatibleTextRendering = $True
	#
	# labelUser
	#
	$labelUser.AutoSize = $True
	$labelUser.Enabled = $False
	$labelUser.Font = 'Microsoft Sans Serif, 8.5pt, style=Bold'
	$labelUser.ForeColor = 'White'
	$labelUser.Location = '12, 426'
	$labelUser.Name = 'labelUser'
	$labelUser.Size = '33, 18'
	$labelUser.TabIndex = 24
	$labelUser.Text = 'User:'
	$labelUser.UseCompatibleTextRendering = $True
	#
	# labelSMTPServer
	#
	$labelSMTPServer.AutoSize = $True
	$labelSMTPServer.Font = 'Microsoft Sans Serif, 8.5pt, style=Bold'
	$labelSMTPServer.ForeColor = 'White'
	$labelSMTPServer.Location = '10, 22'
	$labelSMTPServer.Name = 'labelSMTPServer'
	$labelSMTPServer.Size = '80, 18'
	$labelSMTPServer.TabIndex = 22
	$labelSMTPServer.Text = 'SMTP Server:'
	$labelSMTPServer.UseCompatibleTextRendering = $True
	#
	# txt_from
	#
	$txt_from.Font = 'Microsoft Sans Serif, 8.25pt'
	$txt_from.Location = '52, 68'
	$txt_from.Name = 'txt_from'
	$txt_from.Size = '290, 20'
	$txt_from.TabIndex = 3
	#
	# chkbox_UseSSL
	#
	$chkbox_UseSSL.Font = 'Microsoft Sans Serif, 8pt, style=Bold'
	$chkbox_UseSSL.ForeColor = 'White'
	$chkbox_UseSSL.Location = '143, 422'
	$chkbox_UseSSL.Name = 'chkbox_UseSSL'
	$chkbox_UseSSL.Size = '76, 22'
	$chkbox_UseSSL.TabIndex = 10
	$chkbox_UseSSL.Text = 'Use SSL'
	$chkbox_UseSSL.UseCompatibleTextRendering = $True
	$chkbox_UseSSL.UseVisualStyleBackColor = $True
	$chkbox_UseSSL.add_CheckedChanged($chkbox_UseSSL_CheckedChanged)
	#
	# txt_Subject
	#
	$txt_Subject.Font = 'Microsoft Sans Serif, 8.25pt'
	$txt_Subject.Location = '11, 173'
	$txt_Subject.Name = 'txt_Subject'
	$txt_Subject.Size = '331, 20'
	$txt_Subject.TabIndex = 6
	#
	# txt_body
	#
	$txt_body.Font = 'Microsoft Sans Serif, 8.25pt'
	$txt_body.Location = '12, 223'
	$txt_body.Multiline = $True
	$txt_body.Name = 'txt_body'
	$txt_body.Size = '331, 195'
	$txt_body.TabIndex = 7
	#
	# txt_to
	#
	$txt_to.Font = 'Microsoft Sans Serif, 8.25pt'
	$txt_to.Location = '52, 96'
	$txt_to.Name = 'txt_to'
	$txt_to.Size = '290, 20'
	$txt_to.TabIndex = 4
	#
	# labelTo
	#
	$labelTo.AutoSize = $True
	$labelTo.Font = 'Microsoft Sans Serif, 8.5pt, style=Bold'
	$labelTo.ForeColor = 'White'
	$labelTo.Location = '24, 96'
	$labelTo.Name = 'labelTo'
	$labelTo.Size = '22, 18'
	$labelTo.TabIndex = 31
	$labelTo.Text = 'To:'
	$labelTo.UseCompatibleTextRendering = $True
	#
	# btn_SendEmail
	#
	$btn_SendEmail.FlatStyle = 'Flat'
	$btn_SendEmail.Font = 'Microsoft Sans Serif, 12pt, style=Bold'
	$btn_SendEmail.ForeColor = 'White'
	$btn_SendEmail.Location = '225, 431'
	$btn_SendEmail.Name = 'btn_SendEmail'
	$btn_SendEmail.Size = '117, 79'
	$btn_SendEmail.TabIndex = 11
	$btn_SendEmail.Text = 'Send Message'
	$btn_SendEmail.UseCompatibleTextRendering = $True
	$btn_SendEmail.UseVisualStyleBackColor = $True
	$btn_SendEmail.add_Click($btn_SendEmail_Click)
	#
	# txt_password
	#
	$txt_password.Enabled = $False
	$txt_password.Font = 'Microsoft Sans Serif, 8.25pt'
	$txt_password.Location = '12, 485'
	$txt_password.Name = 'txt_password'
	$txt_password.PasswordChar = '#'
	$txt_password.Size = '206, 20'
	$txt_password.TabIndex = 9
	#
	# txt_user
	#
	$txt_user.Enabled = $False
	$txt_user.Font = 'Microsoft Sans Serif, 8.25pt'
	$txt_user.Location = '12, 444'
	$txt_user.Name = 'txt_user'
	$txt_user.Size = '206, 20'
	$txt_user.TabIndex = 8
	#
	# txt_Port
	#
	$txt_Port.Font = 'Microsoft Sans Serif, 8.25pt'
	$txt_Port.Location = '268, 39'
	$txt_Port.Name = 'txt_Port'
	$txt_Port.Size = '74, 20'
	$txt_Port.TabIndex = 2
	$txt_Port.TextAlign = 'Center'
	#
	# txt_Server
	#
	$txt_Server.Font = 'Microsoft Sans Serif, 8.25pt'
	$txt_Server.Location = '11, 39'
	$txt_Server.Name = 'txt_Server'
	$txt_Server.Size = '237, 20'
	$txt_Server.TabIndex = 1
	#
	# labelPassword
	#
	$labelPassword.AutoSize = $True
	$labelPassword.Enabled = $False
	$labelPassword.Font = 'Microsoft Sans Serif, 8.5pt, style=Bold'
	$labelPassword.ForeColor = 'White'
	$labelPassword.Location = '12, 467'
	$labelPassword.Name = 'labelPassword'
	$labelPassword.Size = '61, 18'
	$labelPassword.TabIndex = 25
	$labelPassword.Text = 'Password:'
	$labelPassword.UseCompatibleTextRendering = $True
	#
	# labelPort
	#
	$labelPort.AutoSize = $True
	$labelPort.Font = 'Microsoft Sans Serif, 8.5pt, style=Bold'
	$labelPort.ForeColor = 'White'
	$labelPort.Location = '268, 22'
	$labelPort.Name = 'labelPort'
	$labelPort.Size = '30, 18'
	$labelPort.TabIndex = 23
	$labelPort.Text = 'Port:'
	$labelPort.UseCompatibleTextRendering = $True
	#
	# labelSMTPRelayAppV10
	#
	$labelSMTPRelayAppV10.AutoSize = $True
	$labelSMTPRelayAppV10.Font = 'Microsoft Sans Serif, 12pt, style=Bold'
	$labelSMTPRelayAppV10.ForeColor = 'White'
	$labelSMTPRelayAppV10.Location = '79, 23'
	$labelSMTPRelayAppV10.Name = 'labelSMTPRelayAppV10'
	$labelSMTPRelayAppV10.Size = '180, 24'
	$labelSMTPRelayAppV10.TabIndex = 22
	$labelSMTPRelayAppV10.Text = 'SMTP Relay App V 1.0'
	$labelSMTPRelayAppV10.UseCompatibleTextRendering = $True
	#
	# openfiledialog1
	#
	$openfiledialog1.FileName = 'openfiledialog1'
	$groupbox2.ResumeLayout()
	$groupbox1.ResumeLayout()
	$formSMTPRelayTestingTool.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formSMTPRelayTestingTool.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formSMTPRelayTestingTool.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formSMTPRelayTestingTool.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $formSMTPRelayTestingTool.ShowDialog()

} #End Function

#Call the form
Show-SMTP_Relay_Tool_V1_0_psf | Out-Null
