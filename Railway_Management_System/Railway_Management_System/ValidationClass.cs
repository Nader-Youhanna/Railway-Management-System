﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Railway_Management_System
{
    class ValidationClass
    {

        //To use this function
        //String err = "";
        //Object data = ValidationClass.isPositiveInteger("3",err);
        // int x = (int)data;

        public static Object isPositiveInteger(String input, StringBuilder err)
        {
            Object returnData = null;
            try
            {
                long x = Convert.ToInt64(input);
                if (x < 0)
                {
                    err.Append("Input " + input + " is a negative number");
                }
                else
                {
                    returnData = x;
                }
            }
            catch
            {
                err.Append("Input " + input + " is not a valid integer");
            }
            return returnData;
        }

    }
}
