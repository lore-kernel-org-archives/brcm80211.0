Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD493595C
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218227; cv=none; b=Y5yyeOI24vYMzmUVnPqV6wIhxh/N5TqOHN4X0x017XjexQnVzAxmvS+M2pQlRcTT/3PrCbjA95u7P80QS6P7zVRyCXrNFaX5FU365XO0uNFypZUxPYyNv82/Fa52Ah7CdisxXZnXGlrPqzujLO+CoRYnsd1O56gpV5uxmRPbaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218227; c=relaxed/simple;
	bh=TATLEc8yWLoSrEOkEJVOcVvh6A655FoOwWh3JdEOR0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+SWw2KDJqGC1stUyhMMalffrOAfmBA3F3Im2qF4JSPgdp+Zvwj9qeBu2WSbP8bygb6aqd9PiEH7Dd9QLDGO3zUH01DKi9IV+jk2eHlgZ6X8HVxZJH2VbVNxYJNh8Yn8uYqJUGjXjsr+POvEd54KhZvSy6sBENPFBDuna+GVCLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiTMMfF8; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiTMMfF8"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7376dd56eccso7717520b3a.0
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744218226; x=1744823026; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gduFr9psKq3/rFKzYti1e6w9zW9vBtwhKjWFoDD4Umw=;
        b=WiTMMfF89u2qwgT5bkZyeQfGXI9UstoicxHmIpimpluw48GBvQbU6CLOZDKwYnxoXG
         j6OIE6R9D5yzESnqEiRh1NqNUP5/ccuC/rMIYpOqaiQOls2xztjEz89wCbO5rGDgzpmR
         ZxYp9XiMFvaJ9ElN/T9UVYE96bRf7BDjLx9dOMJgTrRB9kRsX/V6P+8mw4OQJ+PbDZmL
         lWksPfjcMfgd2NC3LNnk3tib6VpDk40yWWBzm1kUTYl24pRh8ricUOtjQ6HNw/1gW24w
         1RmHmRQCP1v+WfJ8Dy0fwCYiQqZFj+Na1/Ae3Gk7E3920oJYIpc/p2ts1LD7DDmz6iHl
         kGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218226; x=1744823026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gduFr9psKq3/rFKzYti1e6w9zW9vBtwhKjWFoDD4Umw=;
        b=Zsis/lPBzN/ejvy1NWrh3qzcVZhm0qn/V6krrKuoc8xDGkNzuxSLhimkkJQAdskygo
         +CE417QyfBUVg/n7cNPT/V+vJAZGzL+xpa8zLcBXmrgSk5pFNghYYSalUFCihqRRqE+5
         cTiDkJJ2nRQk9IPTHexaJW0Sycitg0eZI+sFkVBWrG6fVqc8sutvV5IjTq9ekWcBeK7M
         EzGrZ0OlzdE/t5ZYWuKG1GszI8EX7cjo/szYG2wJ/W7sO0pnGQytd2/Zhg/rOi7vtejS
         ez9fr1wk2Fz/nhXN7xCBU/Hp0RCXCwk83ArTfnvTNCddc/8m/8ZVqwmLeTkcRUCI9+JN
         GfOg==
X-Forwarded-Encrypted: i=1; AJvYcCWUf+cP2aF1JRsWWocLZZR6I5XUl9SdXgoP+S0SCK4bF4l7Ws7pgjE9rP1E2hw4cr27OwXKL2+tXf8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMaBq1XBgH794L3Z3p6SdkY47X7AiGNpd1KJyRn3MdARRDDZXQ
	9FHFPtUPxAZkntX39bobogU+XStKq5RQ3tGt4WyPEtqR1TxeJIim
X-Gm-Gg: ASbGncvJtYRQAxAwSl2mmWMDq4STtmIl0mKuYu9o+zAdaW+x/17aGIu4LPwVoMdF2sX
	zIItc/Ze28vxOysdkcMAiG9L99+wwArJgLeYWsZRLHLAAmrngkYkeVfswr68hSeEm515Ii+qqdH
	v22yIAEWx/CAmlkHzsyv1xTUDRFUcGUpjn6COsLLbelF+G1ii3W8jlrp3eaVsq7bCibU0XkQSpS
	0h/a1mVTtBKpf5gQLlRw4H9wJKrkPyZ/1sGIIT9M8HUnHS58hMFyMG8Pkjm9HBH0riRDelE5Ix3
	sIjy4wvhrgYLPRMem1wEl9lA4b5nsKRwraH6Hyqt
X-Google-Smtp-Source: AGHT+IFo/aQceu0toKb44OYHKBYM0JofkQ3whuz+MJluns/fIT/s5YOPql0qpyNQQjmA8CWqrkcceg==
X-Received: by 2002:a05:6a00:2408:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-73bae496ce6mr5244634b3a.3.1744218225458;
        Wed, 09 Apr 2025 10:03:45 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d54d32sm1590079b3a.72.2025.04.09.10.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:03:44 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:03:42 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z_aobrK3t7zdwZRK@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-3-visitorckw@gmail.com>

On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> index 70a4024d461e..5e1b7b1742e4 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> @@ -5,6 +5,7 @@
>   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
> @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
>  
>  static u8 calc_parity(u8 val)
>  {
> -	unsigned i;
> -	unsigned tot = 0;
> -
> -	for (i = 0; i < 7; i++)
> -		tot += (val & (1 << i)) ? 1 : 0;
> -	return val | ((tot & 1) ? 0 : 0x80);
> +	return val | (parity_odd(val) ? 0 : 0x80);

So, if val == 0 than parity_odd(val) is also 0, and this can be
simplified just to:
        return parity(val) ? 0 : 0x80;
Or I miss something?

>  }
>  
>  static void vivid_vbi_gen_set_time_of_day(u8 *packet)
> -- 
> 2.34.1
