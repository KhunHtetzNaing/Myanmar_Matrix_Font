Type=Activity
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: false
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Dim tb As Label
	Dim su As StringUtils
	Dim p As PhoneIntents
	Dim lstOne As ListView
	Dim ph As Phone
	Dim lct As Label
	
	Dim share As Button
	Dim sbg As BitmapDrawable
End Sub

Sub Activity_Create(FirstTime As Boolean)
	ph.SetScreenOrientation(1)
	Activity.Color = Colors.White
	tb.Initialize("")
	tb.Color = Colors.rgb(0, 150, 136)
	tb.Text = "About"
	tb.TextColor = Colors.White
	tb.TextSize = 20
	tb.Gravity = Gravity.CENTER
	tb.Typeface = Typeface.DEFAULT_BOLD
	Activity.AddView(tb,0%x,0%y,100%x,55dip)
	
	share.Initialize("share")
	sbg.Initialize(LoadBitmap(File.DirAssets,"share.png"))
	share.Background = sbg
	share.Gravity = Gravity.FILL
	Activity.AddView(share,100%x-40dip,12.5dip,30dip,30dip)
	
	Dim imvLogo As ImageView
	imvLogo.Initialize ("imv")
	imvLogo.Bitmap = LoadBitmap(File.DirAssets , "icon.png")
	imvLogo.Gravity = Gravity.FILL
	Activity.AddView ( imvLogo , 50%x - 50dip  , 62dip ,  100dip  ,  100dip )
	
	Dim lblName As  Label
	Dim bg As ColorDrawable
	bg.Initialize (Colors.DarkGray , 10dip)
	lblName.Initialize ("lbname")
	lblName.Background = bg
	lblName.Gravity = Gravity.CENTER
	lblName.Text = "Myanmar Matrix Font"
	lblName.TextSize = 15
	lblName.TextColor = Colors.White
	Activity.AddView (lblName , 50%x - 90dip , (imvLogo.Height+imvLogo.Top)+7dip , 180dip , 50dip)
	lblName.Height = su.MeasureMultilineTextHeight (lblName, lblName.Text ) + 5dip
	
	Dim c As ColorDrawable
	c.Initialize (Colors.rgb(103, 58, 183), 10dip )
	lstOne.Initialize ("lstOnes")
	lstOne.Background = c
	lstOne.SingleLineLayout .Label.TextSize = 12
	lstOne.SingleLineLayout .Label .TextColor = Colors.White
	lstOne.SingleLineLayout .Label .Gravity = Gravity.CENTER
	lstOne.SingleLineLayout .ItemHeight = 40dip
	lstOne.AddSingleLine2("App Name : Myanmar Matrix Font",1)
	lstOne.AddSingleLine2("App Version : 1.0",2)
	lstOne.AddSingleLine2 ("Font Developer : Anonymous   ", 3)
	lstOne.AddSingleLine2 ("Developed By : Myanmar Android App    ", 4)
	lstOne.AddSingleLine2 ("Website : www.MyanmarAndroidApp.com  ", 5)
	lstOne.AddSingleLine2 ("Facebook : www.fb.com/MmFreeAndroidApps   ", 6)
	Activity.AddView ( lstOne, 30dip , lblName.Height+lblName.top+7dip , 100%x -  60dip, 240dip)
	
	lct.Initialize ("lct")
	lct.TextColor = Colors.Black
	lct.TextSize = 13
	lct.Gravity = Gravity.CENTER
	lct.Text = "If You have any Problem You can contact Me Here."
	Activity.AddView (lct, 10dip,(lstOne.Top+lstOne.Height)+3%y, 100%x - 20dip, 50dip)
	lct.Height = su.MeasureMultilineTextHeight (lct, lct.Text )
End Sub

Sub lbname_Click
	StartActivity(p.OpenBrowser("http://www.MyanmarAndroidApp.com/search?q=Myanmar+Matrix+Font"))
End Sub

Sub lblCredit_Click
	Try
		Dim Facebook As Intent
		Facebook.Initialize(Facebook.ACTION_VIEW, "fb://page/627699334104477")
		StartActivity(Facebook)
	Catch
		Dim Facebook As Intent
		Facebook.Initialize(Facebook.ACTION_VIEW, "https://m.facebook.com/MmFreeAndroidApps")
		StartActivity(Facebook)
	End Try
End Sub


Sub lstOnes_ItemClick (Position As Int, Value As Object)
	Select Value
		Case 1
			StartActivity(p.OpenBrowser("http://www.MyanmarAndroidApp.com/search?q=Myanmar+Matrix+Font"))
		Case 3
			Try
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "fb://page/627699334104477")
				StartActivity(Facebook)
			Catch
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "https://m.facebook.com/MmFreeAndroidApps")
				StartActivity(Facebook)
			End Try
		Case 4
			Try
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "fb://page/627699334104477")
				StartActivity(Facebook)
			Catch
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "https://m.facebook.com/MmFreeAndroidApps")
				StartActivity(Facebook)
			End Try
		Case 5
			StartActivity(p.OpenBrowser("http://www.MyanmarAndroidApp.com"))
		Case 6
			Try
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "fb://page/627699334104477")
				StartActivity(Facebook)
			Catch
				Dim Facebook As Intent
				Facebook.Initialize(Facebook.ACTION_VIEW, "https://m.facebook.com/MmFreeAndroidApps")
				StartActivity(Facebook)
			End Try
	End Select
End Sub

Sub Activity_Resume
     
End Sub

Sub Activity_Pause (UserClosed As Boolean)
     
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