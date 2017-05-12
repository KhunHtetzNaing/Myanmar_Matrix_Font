Type=Activity
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Dim p As Phone
	Dim tb As Label
	Dim share,about As Button
	Dim sbg,abg As BitmapDrawable
	
	Dim mm As Typeface : mm = mm.LoadFromAssets("matrix.ttf")
Dim b1,b2,b3,b4,b5,b6 As Button
Dim b1bg,b2bg,b3bg,b4bg,b5bg,b6bg As ColorDrawable

Dim I As InterstitialAd
Dim B As AdView
End Sub

Sub Activity_Create(FirstTime As Boolean)
	p.SetScreenOrientation(1)
	Activity.Color = Colors.White
	tb.Initialize("")
	tb.Color = Colors.rgb(0, 150, 136)
	tb.Text = "Choose Your Phone!"
	tb.TextColor = Colors.White
	tb.TextSize = 20
	tb.Gravity = Gravity.CENTER
	tb.Typeface = Typeface.DEFAULT_BOLD
	Activity.AddView(tb,0%x,0%y,100%x,55dip)
	
	about.Initialize("about")
	abg.Initialize(LoadBitmap(File.DirAssets,"about.png"))
	about.Background = abg
	about.Gravity = Gravity.FILL
	Activity.AddView(about,10dip,12.5dip,30dip,30dip)
	
	share.Initialize("share")
	sbg.Initialize(LoadBitmap(File.DirAssets,"share.png"))
	share.Background = sbg
	share.Gravity = Gravity.FILL
	Activity.AddView(share,100%x-40dip,12.5dip,30dip,30dip)
	
	b1bg.Initialize(Colors.rgb(63, 81, 181),15)
	b1.Initialize("b1")
	b1.Text = "Samsung"
	b1.Background = b1bg
	b1.Typeface = mm
	b1.TextSize = 15
	Activity.AddView(b1,50%x-100dip,55dip+20dip,200dip,50dip)
	
	b2bg.Initialize(Colors.rgb(76, 175, 80),15)
	b2.Initialize("b2")
	b2.Text = "Oppo"
	b2.TextSize = 15
	b2.Background = b2bg
	b2.Typeface = mm
	Activity.AddView(b2,50%x-100dip,b1.Top+b1.Height+7dip,200dip,50dip)
	
	b3bg.Initialize(Colors.rgb(244, 67, 54),15)
	b3.Initialize("b3")
	b3.Text = "Huawei[EMUI]"
	b3.Background = b3bg
	b3.Typeface = mm
	b3.TextSize = 15
	Activity.AddView(b3,50%x-100dip,b2.Height+b2.Top+7dip,200dip,50dip)
	
	b4bg.Initialize(Colors.rgb(0, 152, 219),15)
	b4.Initialize("b4")
	b4.Text = "Vivo"
	b4.Background = b4bg
	b4.TextSize = 15
	b4.Typeface = mm
	Activity.AddView(b4,50%x-100dip,b3.Height+b3.Top+7dip,200dip,50dip)
	
	b5bg.Initialize(Colors.rgb(255, 103, 0),15)
	b5.Initialize("b5")
	b5.Text = "Xiaomi[MIUI]"
	b5.Typeface = mm
	b5.TextSize = 15
	b5.Background = b5bg
	Activity.AddView(b5,50%x-100dip,b4.Height+b4.Top+7dip,200dip,50dip)
	
	b6bg.Initialize(Colors.Black,15)
	b6.Initialize("b6")
	b6.Text = "Other[#Root]"
	b6.Background = b6bg
	b6.TextSize = 15
	b6.Typeface = mm
	Activity.AddView(b6,50%x-100dip,b5.Top+b5.Height+7dip,200dip,50dip)
	
	B.Initialize("B","ca-app-pub-4173348573252986/5011893350")
	Dim height As Int
	If GetDeviceLayoutValues.ApproximateScreenSize < 6 Then
		If 100%x > 100%y Then height = 32dip Else height = 50dip
	Else
		height = 90dip
	End If
	Activity.AddView(B, 0dip, 100%y - height, 100%x, height)
	B.LoadAd
	Log(B)
	
	I.Initialize("I","ca-app-pub-4173348573252986/6488626550")
	I.LoadAd
End Sub

Sub b1_Click
	StartActivity(Samsung)
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b2_Click
	StartActivity(Oppo)
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b3_Click
	StartActivity(Huawei)
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b4_Click
	StartActivity(Vivo)
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b5_Click
	StartActivity(Xiaomi)
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b6_Click
	StartActivity(Other)
	if I.Ready then I.Show else I.LoadAd
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


'Banner Ads
Sub B_FailedToReceiveAd (ErrorCode As String)
	Log("B failed: " & ErrorCode)
End Sub
Sub B_ReceiveAd
	Log("B received")
End Sub

Sub B_AdScreenDismissed
	Log("B Dismissed")
End Sub

'Interstitial Ads
Sub I_AdClosed
	I.LoadAd
End Sub

Sub I_ReceiveAd
	Log("I Received")
End Sub

Sub I_FailedToReceiveAd (ErrorCode As String)
	Log("I not Received - " &"Error Code: "&ErrorCode)
	I.LoadAd
End Sub

Sub I_adopened
	Log("I Opened")
	I.LoadAd
End Sub

Sub about_Click
	StartActivity(Ab0ut)
End Sub

Sub share_Click
	Dim ShareIt As Intent
	Dim copy As BClipboard
	copy.clrText
	copy.setText("#MyanmarMatrixFont App! Beautiful Myanmar Zawgyi Font Style!	You can Use in Samung, Oppo,Vivo, Huawei (EMUI) and Xiaomi (MIUI) without Root Access!!!! Download Free at : http://www.MyanmarAndroidApp.com/search?q=Myanmar+Matrix+Font")
	ShareIt.Initialize (ShareIt.ACTION_SEND,"")
	ShareIt.SetType ("text/plain")
	ShareIt.PutExtra ("android.intent.extra.TEXT",copy.getText)
	ShareIt.PutExtra ("android.intent.extra.SUBJECT","Get Free!!")
	ShareIt.WrapAsIntentChooser("Share App Via...")
	StartActivity (ShareIt)
End Sub