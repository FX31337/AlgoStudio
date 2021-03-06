using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using PTLRuntime.NETScript;
using System.Drawing;

namespace ind
{
#region (AROON)Aroon
	//---------------------------------------------------
	// Project: Aroon
	// Type: Indicator
	// Author: PFSoft LLC
	// Company: PFSoft LLC /www.pfsoft.com/
	// Copyright: (C) PFSoft LLC Dnepopetrovsk. Ukraine
	// Created: Nov, 28,2006
	//---------------------------------------------------
    public class AROON : NETIndicator
    {
  
        public AROON()
            : base()
        {
        	ProjectName = "Aroon";
        	Comments = "Reveals the beginning of a new trend";
            SetIndicatorLine("line1", Color.Lime, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line2", Color.Teal, 1, LineStyle.IsoDotChart);
            SetIndicatorLine("line3", Color.Red, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line4", Color.Red, 1, LineStyle.IsoDotChart);
            SeparateWindow = true;
        }

        [InputParameter("Period of loking back:", 0)]
        public int IndPeriod = 14;
		[InputParameter("Up signal line:", 1, 1, 100, 2, 1)]
        public double UpSignalLine = 70;
   		[InputParameter("Down signal line:", 2, 1, 100, 2, 1)]
        public double DownSignalLine = 30;
        
        public const int AROON_UP_LINE = 0;
		public const int AROON_DOWN_LINE = 1;    
		public const int UP_SIG_LINE = 2;
		public const int DOWN_SIG_LINE = 3;   
        
        public override void OnQuote()
        {
        	// Setting value of signal lines
		    platform.SetValue(UP_SIG_LINE, 0, UpSignalLine);
		    platform.SetValue(DOWN_SIG_LINE, 0, DownSignalLine);
		    // Getting max and min prices for period
		    int count = platform.BarsCount(platform.Symbol, platform.Period);
		    int i = 0; 
		    int period = 0;
		    double high = ptl.High;
		    double low = ptl.Low;
		    int perHigh = 0;
		    int perLow = 0;
		    while( (i<count) && (period<IndPeriod))
		    {
		        // Skipping empty bar
		        if(!ptl.IsEmpty(i))
		        {
		            double price; price = ptl.High[i];
		            if(price>high)
		            {
		                high = price;
		                perHigh = period;
		            };
		            price = ptl.Low[i];
		            if(price<low)
		            {
		                low = price;
		                perLow = period;
		            };
		            period += 1;    
		        };
		        i += 1;
		    };
		    // Getting Aroon up and down lines
		    double dPeriod = IndPeriod;  // Here we're transforming integer value to double for real division
		    platform.SetValue(AROON_UP_LINE, 0, (1.0 - perHigh/dPeriod)*100.0);
		    platform.SetValue(AROON_DOWN_LINE, 0, (1.0 - perLow/dPeriod)*100.0);

        }
    }
#endregion

#region (CMO)Chande Momentum Oscillator
    //---------------------------------------------------
	// Project: CMO
	// Type: Indicator
	// Author: PFSoft LLC
	// Company: PFSoft LLC /www.pfsoft.com/
	// Copyright: (C) PFSoft LLC Dnepopetrovsk. Ukraine
	// Created: Nov, 28,2006
	//---------------------------------------------------
    public class CMO : NETIndicator
    {
  
        public CMO()
            : base()
        {
        	ProjectName = "Chande Momentum Oscillator";
        	Comments = "Chande Momentum Oscillator";
            SetIndicatorLine("line1", Color.Purple, 1, LineStyle.SimpleChart);
            SeparateWindow = true;
        }

        [InputParameter("Period of MA for envelopes", 0)]
        public int MAPeriod = 8;


        [InputParameter("Sources prices for MA", 1, new object[] {// Definition of sources prices
             "Close", ptl.CLOSE,								// Calculation will be performed on Close prices
             "Open", ptl.OPEN,
             "High", ptl.HIGH,
             "Low", ptl.LOW,
             "Typical", ptl.TYPICAL,
             "Medium", ptl.MEDIUM,
             "Weighted", ptl.WEIGHTED}
        )]
       	public int SourcePrice = ptl.CLOSE;
       	
        public override void OnQuote()
        {
           int count = platform.BarsCount(platform.Symbol, platform.Period);
		    if(count>MAPeriod)
		    {
		        int i = 0;
		        int period = 0;
		        double sum1 = 0.0;
		        double sum2 = 0.0;
		        while((i<count) && (period<MAPeriod))
		        {
		            if(!ptl.IsEmpty(i))
		            {
		                double diff; diff = ptl.GetPrice(SourcePrice, i) - ptl.GetPrice(SourcePrice, i+1);
		                if(diff>0.0)
		                    sum1 += diff;
		                else
		                    sum2 -= diff;
		                period++;
		            }
		            i++;
		        }
		        // Setting value;
		        platform.SetValue(0, 0, 100.0*((sum1-sum2)/(sum1+sum2)));
		    }
        }
    }
#endregion

#region (ICH)Ichimoku
    //---------------------------------------------------
	// Project: Ichimoku
	// Type: Indicator
	// Author: PFSoft LLC
	// Company: PFSoft LLC /www.pfsoft.com/
	// Copyright: (C) PFSoft LLC Dnepopetrovsk. Ukraine
	// Created: Nov, 28,2006
	//---------------------------------------------------
    public class ICH : NETIndicator
    {
    
        public ICH()
            : base()
        {
        	ProjectName = "Ichimoku";
        	Comments = "Enables to quickly discern and filter 'at a glance' the low-probability trading setups from those of higher probability";
            SetIndicatorLine("line1", Color.Blue, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line2", Color.Lime, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line3", Color.SpringGreen, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line4", Color.Red, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line5", Color.Yellow, 1, LineStyle.SimpleChart);
            SeparateWindow = false;
        }
        
		[InputParameter("First period", 0)]
        public int Period1 = 9;
        [InputParameter("Second period", 1)]
        public int Period2 = 26;
        [InputParameter("Third period", 2)]
        public int Period3 = 52;
    
    	[InputParameter("Span A cloud color:", 3)]
        public int SpanAColor = ptl.Blue;
        [InputParameter("Span B cloud color:", 4)]
        public int SpanBColor = ptl.Red;
        [InputParameter("Gradient method", 5, new object[] {
        	"None", ptl.GRADIENT_NONE,
			"Simple", ptl.GRADIENT_SIMPLE,
			"Linear", ptl.GRADIENT_LINEAR}
        )]
        public int GradientMethod = ptl.GRADIENT_SIMPLE;
    
	    public const int TENKAN = 0;
		public const int KIJUN = 1;
		public const int SENKOU_SPANA = 2;
		public const int SENKOU_SPANB = 3;
		public const int CHINKOU_SPAN = 4;

        public override void OnQuote()
        {
        	int count = platform.BarsCount(platform.Symbol, platform.Period); 
		    if((count>Period3)&& (count>Period2)&& (count>Period1))
		    {
		        // Calculation of Tenkan
		        platform.SetValue(TENKAN, 0, GetAverage(Period1, count));
		        // Calculation of Kijun
		        platform.SetValue(KIJUN, 0, GetAverage(Period2, count));        
		        // Calculation of Chinkou Span
		        platform.SetValue(CHINKOU_SPAN,  Period2, ptl.Close);        
		        // Calculation of Senkou Span A
		        double prevTenkan = platform.GetValue(TENKAN, Period2);
		        double prevKijun = platform.GetValue(KIJUN, Period2);
		        double senkouSpanA; 
		        if(prevTenkan>prevKijun)
		            senkouSpanA = (prevTenkan - prevKijun)/2.0 + prevKijun;
		        else
		            senkouSpanA = (prevKijun - prevTenkan)/2.0 + prevTenkan;
		        platform.SetValue(SENKOU_SPANA, 0, senkouSpanA);
		        // Calculation of Senkou Span B
		        double senkouSpanB;
		        ptl.Array[SENKOU_SPANB] = GetAverage(Period3, count);
		        senkouSpanB = platform.Array[SENKOU_SPANB, Period2];
		        platform.SetValue(SENKOU_SPANB, 0, senkouSpanB);
		        
		        platform.SetCloud(0, 0, senkouSpanA, senkouSpanB, //borders
		            platform.CustomBarColor[SENKOU_SPANA,0], platform.CustomBarColor[SENKOU_SPANB,0], GradientMethod); //back

		    }
        }
        
        public double GetAverage(int period, int count)
		{
		    double high = 0;
		    double low = 1000000.0;
		    double price = 0;
		    int i = 0;
		    bool result = false;
		    while((period>0) && (i<count))
		    {
	        	result = true;
		        price = ptl.High[i];
		        if(high<price) 
		        	high = price;
		        price = ptl.Low[i];
		        if(low>price) 
		        	low = price;
		        period--;
		     	i++;
		     }
		     
		     if(result)
		         return (high+low)/2.0;
		     else
		         return 0.0;
		}
    }
#endregion

#region (MOMENTUM)Momentum
    //---------------------------------------------------
	// Project: Momentum
	// Type: Indicator
	// Author: PFSoft LLC
	// Company: PFSoft LLC /www.pfsoft.com/
	// Copyright: (C) PFSoft LLC Dnepopetrovsk. Ukraine
	// Created: Nov, 28,2006
	//---------------------------------------------------
    public class MOMENTUM : NETIndicator
    {
  
        public MOMENTUM()
            : base()
        {
        	ProjectName = "Momentum";
        	Comments = "Momentum";
            SetIndicatorLine("line1", Color.Lime, 2, LineStyle.DotLineChart);
            SeparateWindow = true;
        }

        [InputParameter("Period of momentum:", 0)]
        public int MomPeriod = 20;

        public override void OnQuote()
        {
        	int count = platform.BarsCount(platform.Symbol, platform.Period);
            if(count>MomPeriod)
        		platform.SetValue(0, 0, ptl.Close - ptl.Close[MomPeriod]);
        }
    }
#endregion

#region (PO)Price Oscillator
    //---------------------------------------------------
	// Project: PO
	// Type: Indicator
	// Author: PFSoft LLC
	// Company: PFSoft LLC /www.pfsoft.com/
	// Copyright: (C) PFSoft LLC Dnepopetrovsk. Ukraine
	// Created: Nov, 28,2006
	//---------------------------------------------------
    public class PO : NETIndicator
    {
  
        public PO()
            : base()
        {
        	ProjectName = "Price Oscillator";
        	Comments = "The variation between price moving averages ";
            SetIndicatorLine("line1", Color.Blue, 1, LineStyle.SimpleChart);
            SeparateWindow = true;
        }

        
	   [InputParameter("Type of Moving Average", 0, new object[] {
            "Simple", "SMA",
            "Exponential", "EMA",
            "Modified", "MMA",
           	"Linear Weighted", "LWMA"}
        )]
        public string MAType = "SMA"; 

        [InputParameter("Sources prices for MA", 1, new object[] {
             "Close", ptl.CLOSE,
             "Open", ptl.OPEN,
             "High", ptl.HIGH,
             "Low", ptl.LOW,
             "Typical", ptl.TYPICAL,
             "Medium", ptl.MEDIUM,
             "Weighted", ptl.WEIGHTED}
        )]
        public int SourcePrice = ptl.CLOSE;

		[InputParameter("Period of MA1", 2)]
        public int MAPeriod1 = 2;
        [InputParameter("Period of MA2", 3)]
        public int MAPeriod2 = 25;
        
        public override void OnQuote()
        {
           if(ptl.MathMax(MAPeriod1, MAPeriod2)<platform.BarsCount(platform.Symbol, platform.Period))
		   {
		       double value1 = platform.iCustom(MAType, platform.Symbol, platform.Period, 0, 0, MAPeriod1, SourcePrice);
		       double value2 = platform.iCustom(MAType, platform.Symbol, platform.Period, 0, 0, MAPeriod2, SourcePrice);
		       platform.SetValue(0, 0, value1 - value2);
		   }
        }
    }
#endregion

#region (SAR)Parabolic Time/Price System
	//---------------------------------------------------
	// Project: pSAR
	// Type: Indicator
	// Author: PFSoft LLC
	// Company: PFSoft LLC /www.pfsoft.com/
	// Copyright: (C) PFSoft LLC Dnepopetrovsk. Ukraine
	// Created: Nov, 28,2006
	//---------------------------------------------------
    public class SAR : NETIndicator
    {
  
        public SAR()
            : base()
        {
        	ProjectName = "Parabolic Time/Price System";
        	Comments = "Helps to define the direction of the prevailing trend and the moment to close positions opened during the reversal";
            SetIndicatorLine("line1", Color.Firebrick, 4, LineStyle.DotChart);
            SeparateWindow = false;
        }

        [InputParameter("Step of parabolic SAR system", 0, 2)]
        public double Step = 0.02;
		[InputParameter("Y factor", 1, 1)]
        public double KoeffY = 0.2;

        public int direction = 1; // Direction of the SAR System
		public double pSAR;
		public double af;
		public bool first = true;
		public double maxAu = 0.0;
		public double minAu = 100000000.0;
        
        public override void OnQuote()
        {
        	if(first)
		    {
		        pSAR = ptl.Low[0]; 
		        if(pSAR>0.0)
		            first = false;
		        else
		            return;
		    }
		    
		    double auL = ptl.Low[0];
		    double auH = ptl.High[0];
		
		    if((auL > 0.0)&&(auH > 0.0))
		    {
		        if (direction == 0)
		        {
		            if (!(pSAR < auL)) // pSAR>=auL
		            {
		                pSAR = ptl.MathMax(auH, maxAu);
		                maxAu = auH;
		                minAu = auL;
		                direction = 1;
		            }
		            else
		            {
		                pSAR = (auL - pSAR) * af + pSAR;
		                if(af<KoeffY)
		                    af = af + Step;
		                if (maxAu < auH)
		                    maxAu = auH;
		            }
		        }
		        else
		        {
		            if (!(pSAR > auH)) // pSAR<=auH
		            {
		                pSAR = ptl.MathMin(minAu, auL);
		                minAu = auL;
		                maxAu = auH;
		                direction = 0;
		            }
		            else
		            {
		                pSAR = (auH - pSAR) * af + pSAR;
		                if(af<KoeffY)
		                    af = af + Step;
		                if(minAu>auL)
		                    minAu = auL;
		            }
		        }
		        if( (auH > 0.0) && (auL >0.0) && (pSAR > 0.0) )
		        {
		            platform.SetValue(0, 0, pSAR);
		        }
		    }
        }
    }
#endregion

#region (SSD)Stochastic Slow
	//---------------------------------------------------
	// Project: SlowCtoch
	// Type: Indicator
	// Author: PFSoft LLC
	// Company: PFSoft LLC /www.pfsoft.com/
	// Copyright: (C) PFSoft LLC Dnepopetrovsk. Ukraine
	// Created: Nov, 28,2006
	//---------------------------------------------------
    public class SSD : NETIndicator
    {
  
        public SSD()
            : base()
        {
        	ProjectName = "Stochastic Slow";
        	Comments = "Shows the location of the current close relative to the high/low range over a set number of periods (Slow)";
            SetIndicatorLine("line1", Color.Green, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line2", Color.LightSkyBlue, 1, LineStyle.ShapedChart);
            SetIndicatorLine("line3", Color.Blue, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line4", Color.Yellow, 1, LineStyle.ShapedChart);
            SeparateWindow = true;
        }

        [InputParameter("Period of indicator:", 0)]
        public int IndPeriod = 10;
		[InputParameter("Smoothing:",1)]
        public int Smooth = 3;
        [InputParameter("Double smoothing:", 2)]
        public int DoubleSmooth = 3;
        
        [InputParameter("Up line level:", 3, 0.0, 100.0, 1, 0.1)]
        public double UpLevel = 80.0;
        
        [InputParameter("Bottom line level:", 4, 0.0, 100.0, 1, 0.1)]
        public double BottomLevel = 20.0;
        
      	public const int MAIN_BUFFER = 0;
        
        public override void OnQuote()
        {
	        platform.SetValue(2, 0, UpLevel);
		    platform.SetValue(3, 0, BottomLevel);
		    int i = 0; 
		    int period = 0;
		    int count = platform.BarsCount(platform.Symbol, platform.Period);
		    double high = -1.0;
		    double low = 10000000;
		    while((i<count) && (period<IndPeriod))
		    {
		        if(!ptl.IsEmpty(i))
		        {
		            double price = ptl.High[i];
		            if(price>high)
		                high = price;
		            price = ptl.Low[i];
		            if(price<low)
		                low = price;    
		            period++;    
		        }
		        i++;        
		    }
		    
		    high -= low;
		    if(high>0.0)
		        ptl.Array[MAIN_BUFFER] = 100.0*( (ptl.Close-low)/high );
		    else
		        ptl.Array[MAIN_BUFFER] = 0.0;
		
		    // Calculation of smoothed curve
		    i = 0;
		    double summa = 0.0;
		    while( (i<count) && (i<Smooth) )
		    {   
		        summa += platform.Array[0, i];
		        i++;
		    }
		    platform.SetValue(0, 0, summa/Smooth);
		    
		    
		    // Calculation of double smoothed curve
		    i = 0;
		    summa = 0.0;
		    while( (i<count) && (i<DoubleSmooth) )
		    {   
		        summa += platform.GetValue(0, i);
		        i++;
		    }
		    platform.SetValue(1, 0, summa/DoubleSmooth);	    
        }
    }
#endregion

#region (STOCHASTIC)Stochastic	
	//---------------------------------------------------
	// Project: Stoch
	// Type: Indicator
	// Author: PFSoft LLC
	// Company: PFSoft LLC /www.pfsoft.com/
	// Copyright: (C) PFSoft LLC Dnepopetrovsk. Ukraine
	// Created: Nov, 28,2006
	//---------------------------------------------------
    public class STOCHASTIC : NETIndicator
    {
  
        public STOCHASTIC()
            : base()
        {
        	ProjectName = "Stochastic";
        	Comments = "Shows the location of the current close relative to the high/low range over a set number of periods";
            SetIndicatorLine("line1", Color.Green, 1, LineStyle.ShapedDotChart);
            SetIndicatorLine("line2", Color.LightSkyBlue, 1, LineStyle.ShapedChart);
            SetIndicatorLine("line3", Color.Red, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line4", Color.Yellow, 1, LineStyle.ShapedChart);
            SeparateWindow = true;
        }

        [InputParameter("Period of indicator:", 0)]
        public int IndPeriod = 10;
		[InputParameter("Smoothing:",1)]
        public int Smooth = 3;
        
        [InputParameter("Up line level:", 2, 0.0, 100.0, 1, 0.1)]
        public double UpLevel = 80.0;
        
        [InputParameter("Bottom line level:", 3, 0.0, 100.0, 1, 0.1)]
        public double BottomLevel = 20.0;
        
      	public const int MAIN_BUFFER = 0;
      	
        public override void OnQuote()
        {
			platform.SetValue(2, 0, UpLevel);
		    platform.SetValue(3, 0, BottomLevel);
		    int i = 0; 
		    int period = 0;
		    int count = platform.BarsCount(platform.Symbol, platform.Period);
		    double high = -1.0;
		    double low = 10000000;
		    while((i<count) && (period<IndPeriod))
		    {
	            double price = ptl.High[i];
	            if(price>high)
	                high = price;
	            price = ptl.Low[i];
	            if(price<low)
	                low = price;    

	            period++;    
		        i++;        
		    }
		    
		    high -= low;
		    if(high>0.0)
		    {
		        double k;
		        k = 100.0*( (ptl.Close-low)/high );
		        platform.SetValue(0, 0, k);
		    }
		    else
		    	platform.SetValue(0, 0, 100);
	    
		    // Calculation of smoothed curve
		    i = 0;
		    double summa = 0.0;
		    while( (i<count) && (i<Smooth) )
		    {   
		        summa += platform.GetValue(0, i);
		        i++;
		    }
		    
		    platform.SetValue(1, 0, summa/Smooth);
        }
    }
#endregion
   
    //---------------mql4---------------//

#region (MD)McGinley Dynamic    
    [FullRefresh]
    [KillExceptions]	
  	public class MD : NETIndicator
    {
  
        public MD()
            : base()
        {
        	ProjectName = "McGinley Dynamic";
        	Comments = "McGinley Dynamic Indicator";
            SetIndicatorLine("line1", Color.Red, 2, LineStyle.SimpleChart);
            SeparateWindow = false;      
        }

        [InputParameter("Note", 0)]
        public string Note = "NumberOfBars = 0 means all bars";
        
        [InputParameter("NumberOfBars", 1)]
        public int NumberOfBars = 1000;
        
        [InputParameter("Periods", 2)]
        public int Periods = 12;
        
        [InputParameter("Smoothing", 3)]
        public int Smoothing = 125;
        
        public int mult = 1;
        
        public IArray buffer1; 
				
		public override void Init()
		{ 
			if ( mql4.Digits == 3 || mql4.Digits == 5 )
				mult = 10;
			//---- indicators
			platform.SetIndexBuffer(0, ref buffer1);
		}
        
        public override void OnQuote()
        {
           int limit = 0;
		   int counted_bars = platform.IndicatorCounted();
		//---- last counted bar will be recounted
		   if(counted_bars>0) counted_bars--;
		   if ( NumberOfBars == 0 ) 
		      NumberOfBars = mql4.Bars-counted_bars;
		   limit=NumberOfBars;
		
		   for(int i=0; i<limit; i++)   
		      {
		         
		         //  Ref(Mov(C,12,E),-1)+((C-(Ref(Mov(C,12,E),-1))) / (C/(Ref(Mov(C,12,E),-1))*125))
		            
		         buffer1[i] = mql4.iMA(mql4.NULL,0,Periods,0,mql4.MODE_EMA,mql4.PRICE_CLOSE,i+1) 
		         +
		         ( (mql4.Close[i] - (mql4.iMA(mql4.NULL,0,Periods,0,mql4.MODE_EMA,mql4.PRICE_CLOSE,i+1)))
		         /
		         (mql4.Close[i] / (mql4.iMA(mql4.NULL,0,Periods,0,mql4.MODE_EMA,mql4.PRICE_CLOSE,i+1)) * Smoothing) );
		          
		      
		      }
		//----
		            
        }
    }
#endregion

#region (RLW)%R Larry Williams
	[FullRefresh]
    [KillExceptions]
	public class RLW : NETIndicator
    {
  
        public RLW()
            : base()
        {
        	ProjectName = "%R Larry Williams";
        	Comments = "Uses Stochastic to determine overbought and oversold levels";
            SetIndicatorLine("line1", Color.DodgerBlue, 1, LineStyle.SimpleChart);
            SeparateWindow = true;      
        }

        [InputParameter("ExtWPRPeriod", 0)]
        public int ExtWPRPeriod = 14;
        
        public IArray ExtWPRBuffer; 
		
		
		public override void Init()
		{ 
		   string sShortName = "";
		//---- indicator buffer mapping
		   platform.SetIndexBuffer(0, ref ExtWPRBuffer);
		//---- name for DataWindow and indicator subwindow label
		   sShortName="%R(" + ExtWPRPeriod + ")";
		   platform.IndicatorShortName(sShortName);
		   mql4.SetIndexLabel(0, sShortName);
		//---- first values aren't drawn
		   platform.SetIndexDrawBegin(0, ExtWPRPeriod);
		}
        
        public override void OnQuote()
        {
        	 int i = 0, nCountedBars = 0;  
		//---- insufficient data
		   if(mql4.Bars <= ExtWPRPeriod) 
		       return;
		//---- bars count that does not changed after last indicator launch.
		   nCountedBars = platform.IndicatorCounted();
		//----WilliamsвЂ™ Percent Range calculation
		   i = mql4.Bars - ExtWPRPeriod - 1;
		   if(nCountedBars > ExtWPRPeriod) 
		       i = mql4.Bars - nCountedBars - 1;  
		   while(i >= 0)
		     {
		       double dMaxHigh = mql4.High[mql4.Highest(mql4.NULL, 0, mql4.MODE_HIGH, ExtWPRPeriod, i)];
		       double dMinLow = mql4.Low[mql4.Lowest(mql4.NULL, 0, mql4.MODE_LOW, ExtWPRPeriod, i)];      
		       if(!CompareDouble((dMaxHigh - dMinLow), 0.0))
		           ExtWPRBuffer[i] = -100*(dMaxHigh - mql4.Close[i]) / (dMaxHigh - dMinLow);
		       i--;
		     }            
        }
        
        public bool CompareDouble(double Number1, double Number2)
		{
		   bool Compare = mql4.NormalizeDouble(Number1 - Number2, 8) == 0;
		   return(Compare);
		} 
        
    }
#endregion

#region (MACD)Moving Average/Convergence Divergence 
    [FullRefresh]
    [KillExceptions]	
  	public class MACD : NETIndicator
    {
  
        public MACD()
            : base()
        {
        	ProjectName = "Moving Average/Convergence Divergence";
        	Comments = "A trend-following momentum indicator that shows the relationship between two moving averages of prices";
            SetIndicatorLine("line1", Color.DodgerBlue, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line2", Color.Red, 1, LineStyle.SimpleChart);
            SetIndicatorLine("line3", Color.Green, 1, LineStyle.SimpleChart);
            SeparateWindow = true;      
        }

        [InputParameter("FastEMA", 0)]
        public int FastEMA=12;
        [InputParameter("SlowEMA", 1)]
        public int SlowEMA=26;
        [InputParameter("SignalSMA", 2)]
        public int SignalSMA=9;
        
        public IArray MacdBuffer; 
		public IArray SignalBuffer;
		public IArray Histogram;
		
		public override void Init()
		{ 
			mql4.SetIndexStyle(2, mql4.DRAW_HISTOGRAM);
			platform.SetIndexBuffer(0, ref MacdBuffer);
			platform.SetIndexBuffer(1, ref SignalBuffer);
			platform.SetIndexBuffer(2, ref Histogram);
			mql4.SetIndexLabel(0,"MACD");
			mql4.SetIndexLabel(1,"Signal");
			mql4.SetIndexLabel(2,"Histogram");
		}
        
        public override void OnQuote()
        {
           int limit;
		   int counted_bars=platform.IndicatorCounted();
		   if(counted_bars>0) counted_bars--;
		   counted_bars = Math.Max( Math.Max(counted_bars, FastEMA) , Math.Max(SlowEMA, SignalSMA) );
		   limit=mql4.Bars-counted_bars;
		   for(int i=0; i<limit; i++)
		   	  MacdBuffer[i]=mql4.iMA(mql4.NULL,0,FastEMA,0,mql4.MODE_EMA,mql4.PRICE_CLOSE,i)-mql4.iMA(mql4.NULL,0,SlowEMA,0,mql4.MODE_EMA,mql4.PRICE_CLOSE,i);
		   for(int i=0; i<limit; i++)
		      SignalBuffer[i]=mql4.iMAOnArray(ref MacdBuffer,mql4.Bars,SignalSMA,0,mql4.MODE_SMA,i);
		   for(int i=0; i<limit; i++)
		      Histogram[i]=(double)MacdBuffer[i] - (double)SignalBuffer[i];
		 }
    }
#endregion 
    
}

