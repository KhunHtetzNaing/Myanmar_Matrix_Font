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
	Dim lb As Label
	Dim mm As Typeface : mm = mm.LoadFromAssets("Matrix.ttf")
	
	Dim tb As Label
	Dim share,About As Button
	Dim sbg,abg As BitmapDrawable
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
	
	Activity.Color = Colors.White
	tb.Initialize("")
	tb.Color = Colors.rgb(0, 150, 136)
	tb.Text = ""
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
	
	lb.Initialize("lb")
	lb.Color = Colors.White
	lb.Gravity = Gravity.CENTER
	lb.Typeface = mm
	lb.TextSize = 20
	lb.TextColor = Colors.Magenta
	Activity.AddView(lb,0%x,55dip,100%x,100%y)
	lb.Visible = True
	lb.Text = "File Manager တစ္ခုခုထဲသို႔သြားၿပီး Vivo Myanmar Font ဖိုဒါထဲကိုဝင္ပါ။ Matrix.txj (သို့) Matrix.itz ကိုဖြင့္ၿပီး Apply လုပ္ေပးလိုက္ပါ သို႔မဟုတ္ *ေဖာင့္ေျပာင္းမည္(၂) နဲ႔ကိုနွိပ္ျပီး ထပ္သြင္းနိုင္ပါတယ္။"
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

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