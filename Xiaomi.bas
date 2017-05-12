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
	Dim tb As Label
	Dim share,About As Button
	Dim sbg,abg As BitmapDrawable
	Dim mm As Typeface : mm = mm.LoadFromAssets("matrix.ttf")
	Dim td As Label
	
	Dim b1,b2,b3,b4 As Button
	Dim b1bg,b2bg,b3bg,b4bg As ColorDrawable
	
	Dim B As AdView
	Dim I As InterstitialAd
	
	Dim ml As MLfiles
	Dim sdroot As String
	Dim zip As ABZipUnzip
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
	Activity.Color = Colors.White
	tb.Initialize("")
	tb.Color = Colors.rgb(0, 150, 136)
	tb.Text = "Xiaomi[MIUI]"
	tb.TextColor = Colors.White
	tb.TextSize = 20
	tb.Gravity = Gravity.CENTER
	tb.Typeface = Typeface.DEFAULT_BOLD
	Activity.AddView(tb,0%x,0%y,100%x,55dip)
	
	About.Initialize("about")
	abg.Initialize(LoadBitmap(File.DirAssets,"about.png"))
	About.Background = abg
	About.Gravity = Gravity.FILL
	Activity.AddView(About,10dip,12.5dip,30dip,30dip)
	
	share.Initialize("share")
	sbg.Initialize(LoadBitmap(File.DirAssets,"share.png"))
	share.Background = sbg
	share.Gravity = Gravity.FILL
	Activity.AddView(share,100%x-40dip,12.5dip,30dip,30dip)
	
	td.Initialize("")
	td.Text = "*ထည့္သြင္းမည္* ကိုနွိပ္ပါ။ ျပီးရင္ေအာက္ပါ *ေဖာင့္ေျပာင္းမည္* ကိုနွိပ္ျပီး System Font မွာ Myanmar Matrix Font ကိုေရြးေပးလိုက္ပါ။ သို့မဟုတ္ Theme ထဲက Font မွာ Myanmar Matrix Font ကိုေရြးျပီး Apply ေပးလိုက္ပါ။ နဂိုမူလေဖာင့္ကိုျပန္ထားခ်င္ရင္ *ေဖာင့္ေျပာင္းမည္* ကိုနွိပ္ျပီး Default ကိုျပန္ေရြးထားနိုင္ပါတယ္။"
	td.Gravity = Gravity.CENTER
	td.Typeface = mm
	td.TextSize = 15
	td.TextColor = Colors.Black
	Activity.AddView(td,0%x,62dip,100%x,170dip)
	
	b1bg.Initialize(Colors.rgb(33, 150, 243),15)
	b1.Initialize("b1")
	b1.TextSize = 15
	b1.Text = "ထည့္သြင္းမည္"
	b1.Typeface = mm
	b1.Background = b1bg
	Activity.AddView(b1,50%x-100dip,td.Height+td.Top+7dip,200dip,50dip)
	
	b2bg.Initialize(Colors.Black,15)
	b2.Initialize("b2")
	b2.Text = "ေဖာင့္ေျပာင္းမည္"
	b2.TextSize = 15
	b2.Typeface = mm
	b2.Background = b2bg
	Activity.AddView(b2,50%x-100dip,b1.Top+b1.Height+7dip,200dip,50dip)
	
	b3bg.Initialize(Colors.rgb(233, 30, 99),15)
	b3.Initialize("b3")
	b3.Text = "ထည့္သြင္းအသုံးျပုနည္း"
	b3.Typeface = mm
	b3.TextSize = 15
	b3.Background = b3bg
	Activity.AddView(b3,50%x-100dip,b2.Top+b2.Height+7dip,200dip,50dip)
	
	b4bg.Initialize(Colors.rgb(63, 81, 181),15)
	b4.Initialize("b4")
	b4.Text = "အျခား App မ်ားရယူရန္"
	b4.TextSize = 15
	b4.Background = b4bg
	b4.Typeface = mm
	Activity.AddView(b4,50%x-100dip,b3.Top+b3.Height+7dip,200dip,50dip)
	
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
	Dim dialog As CustomDialog
	Dim lb As Label
	lb.Initialize(dialog)
	lb.Typeface = mm
	lb.TextSize = 16
	lb.TextColor = Colors.Red
	lb.Color = Colors.White
	lb.Text = "*ထည့္သြင္းမည္* ကိုနွိပ္ပါ။ ျပီးရင္ေအာက္ပါ *ေဖာင့္ေျပာင္းမည္* ကိုနွိပ္ျပီး System Font မွာ Myanmar Matrix Font ကိုေရြးေပးလိုက္ပါ။ သို့မဟုတ္ Theme ထဲက Font မွာ Myanmar Matrix Font ကိုေရြးျပီး Apply ေပးလိုက္ပါ။ အဆင္ေျပခဲ့လၽွင့္ ညာဘက္အေပၚေဒါင့္က share ခလုတ္ေလးကိုႏွိပ္ၿပီး သူငယ္ခ်င္းေတြဆီျပန္လည္မၽွေဝေပးလိုက္ပါ။	ထည့္သြင္းလို႔အဆင္မေျပခဲ့ရင္ေတာ့ *ထည့္သြင္းအသုံးျပဳနည္း* ကိုႏွိပ္ၿပီးဘယ္လိုလုပ္ရမလဲသြားၾကည့္နိုင္ပါတယ္။ အျခားျမန္မာေဖာင့္အလွမ်ား၊ အသုံးဝင္ျမန္မာ App မ်ားရယူဖို႔ *အျခား App မ်ားရယူရန္* ဆိုတဲ့ခလုတ္ကိုႏွိပ္ၿပီးသြားယူနိုင္ပါတယ္။"
	dialog.AddView(lb, 0dip, 10dip, 100%x - 40dip, 100%y)
	dialog.Show("ေက်းဇူးျပဳ၍ဖတ္ေပးပါ။", "Ok", "", "", LoadBitmap(File.DirAssets, "about.png"))
	
	ml.mkdir ("/sdcard/MIUI/theme")
	If ml.Exists("/sdcard/MIUI/theme")Then
	Else
		Msgbox("MISSING FILE","Error")
		Activity.Finish
	End If

	sdroot = File.DirDefaultExternal & "/"
	File.Copy(File.DirAssets, "data.zip", File.DirDefaultExternal, "data.zip")
	
	Log(zip.ABUnzip(sdroot & "data.zip", File.DirRootExternal & "/MIUI/theme"))
	Log(File.ListFiles(File.DirrootExternal& "/MIUI/theme"))
	
	ml.RootCmd("dd if="&File.DirrootExternal &"/MIUI/theme/.data of="&File.DirRootExternal&"/MIUI/theme","",Null,Null,False)
	ml.mkdir ("/sdcard/MIUI/theme")
	Msgbox("Now! you can Change Font","Completed")
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b2_Click
	Dim ii As Intent
	ii.Initialize(ii.Action_Main,"")
	ii.SetComponent("com.android.settings/com.android.settings.Settings$FontSettingsActivity")
	Try
		StartActivity(ii)
	Catch
		Msgbox("Missing Font."&CRLF&"(or)"&CRLF&"Your Phone Is Not Xiaomi.","Error")
	End Try
	
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b3_Click
	StartActivity(Guide)
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b4_Click
	Dim pb As PhoneIntents
	StartActivity(pb.OpenBrowser("http://www.myanmarandroidapp.com/p/we-apps.html"))
	If I.Ready Then I.Show Else I.LoadAd
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

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

