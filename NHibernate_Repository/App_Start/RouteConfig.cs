﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Swinkaran.Nhbnt.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Books",
                url: "Book/",
                defaults: new { controller = "Book", action = "Index", id = UrlParameter.Optional }
                );

            routes.MapRoute(
                name: "Book",
                url: "Book/Book/{id}",
                defaults: new { controller = "Book", action = "Details", id = UrlParameter.Optional }
                );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );


        }
    }
}
