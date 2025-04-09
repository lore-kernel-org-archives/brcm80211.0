Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B4B25FA09
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 17:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744219454; cv=none; b=r7RS2AUW8Ba2LM9WB7fcc8mxnIhEP10HR+rq0k1VRvQOV/43hPXSsKeDUWSwskflfC/WaWAGBgSaZX8pxfPdRcQG++/vGLaeMID4ryCV0YaPApkysjZxZCUtOteEMi9ITvBFgcDqdGv2t73uODDN8HrBw5VPJW/1ddF93iCcfi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744219454; c=relaxed/simple;
	bh=Rwe8Y5EY05DaVr5ui2bXVFwv20PZbqJqTEzIsURCcWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0obyshKdipmqxJB0t8bFD2hE6WBD1gG7lYo+Kyz4/aCAzO4QjCsoyG9Vf4F607IxbtPhnao+glTr7zu65SYsA8CkmUY/Zt04DZWQzo4pyOAPSa9sSZfEqCAmD/pXs5jNOpWPh1NKbZtXYsLRQ1KN3x6XsQpDmnkqeYPh/zBQaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mr60k92Q; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mr60k92Q"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af59512c64fso4787578a12.0
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 10:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744219452; x=1744824252; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xd6xaUI5nv9NKBM15KV37XOGcT5rm8Sii0IDXetnYDU=;
        b=mr60k92Qv1HQwuO9Iw46wQNwcXoJB6w7EU9SUniqyHCkC2+a0c0uNH77Zg7Pk+va6f
         IbzZyS4oQShiqiW3wgMPDBcmtHsVWNjEtHEjbqVF5gv6H4NIjpTayaMWys98pJa5M9AY
         VXeZQgniwewB0Ms6Lhg2l6zkPcUyyud4/qN30xWyYan3N4dH/hHOMHZrkQz47jrK2zSk
         LLT4HHP5m4QInXC1RrGykpt1pdcGKRuqDUHLVpKFLpWTSrmvO6QZ44/esWHZ5UnpsDdv
         LkwwaoneseqHRi5+i7QG6aD1kRc7Lz6DKlW2EwOyQx6d2b/Jx31f32HJ8X5PcQeZmIS1
         /hAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744219452; x=1744824252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd6xaUI5nv9NKBM15KV37XOGcT5rm8Sii0IDXetnYDU=;
        b=ZyBHHtjcQUl1UMXU0CPV6plcF9MBeWXnoMpNrcp0CsuYUBFCSdDqi69Rfj++VztLn3
         zR7zkgIWs7ZckvAlQ9UYxq1dkNIsuVmEb9f0wZO4Cx9MFZJ5jtIIi7lLSkKAvlXQNDAs
         EcJALb7JUs/VLFpaStZlLFLbnKtyBh+fLHMxpEIghfX2jwNiXZ/SiqQbR0PuP28Plcs0
         LxosGqkSxtvwxylATxKg4dMccqlP7Qru9zevgqtjIyHUJ16EPS0FcplFXClhhReM5gRo
         BoKOQrHBymuTNkkZjMY3J/IY1yH7quVVdqeaC53IcQX6M+62URCrfLDhFCiqRUqjVZCo
         RrHg==
X-Forwarded-Encrypted: i=1; AJvYcCWUDos2bQJjxrzfQU1t9hQuZMmkr2QwKm60B+02CNAF3bYCQQQq43n4ZyIuHzetlsPelQkAy00ypAc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8/HwoSZyVG6/qewfjugzgynw0mHkBtoQOAMLsso3vKijE7Hzf
	5v+eU6uA09KvrY1q9WFoikxGC8U7c6CiNrwYd/AzkwgV2HFW+bx6
X-Gm-Gg: ASbGncv7SyYL/MPHmcFSAR3WEKS3ZCV9/G2IIlJ3Fth7Rnv4QlfB2i3WSwp8/sVElCB
	CcVP6s8v8ty0LM6MSi8hI6Ete2S/PejlsGwWs0D0mzHdlX10hew8Z8+moa83u7xt/qWq3YMe3VI
	p+jVqauslgUjDQflmi0Vo2jPVtJjgE0nZS5hebVV3TMeA1Z8e04xWY5KXcBxXNzAGpPliJ6lbXy
	yGCFA/2kr7mvcc6CCTRIcUB/iUXNmHaBnvVsUsAs7mFQ5XPjSHsIvf4QjJ2otKYPm1jBpiZEjus
	TA4N5+tqWC0PAW7A3g8l0gCnn4OxqGMQLt0YEsb/
X-Google-Smtp-Source: AGHT+IELcovaPBJxMo6VlfeeTod3PlQVQYXafQRyaLUWNqmSnypRNDEVNTbdlgjgS5FV2ZA5ueCy6w==
X-Received: by 2002:a17:90b:6ce:b0:301:1d03:93cd with SMTP id 98e67ed59e1d1-306dd556630mr5093919a91.24.1744219451960;
        Wed, 09 Apr 2025 10:24:11 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b4d5sm2098089a91.25.2025.04.09.10.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:24:11 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:24:08 -0400
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
Subject: Re: [PATCH v4 05/13] serial: max3100: Replace open-coded parity
 calculation with parity_odd()
Message-ID: <Z_atODqZDkff5sjj@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-6-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-6-visitorckw@gmail.com>

On Wed, Apr 09, 2025 at 11:43:48PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  drivers/tty/serial/max3100.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
> index f2dd83692b2c..36ed41eef7b1 100644
> --- a/drivers/tty/serial/max3100.c
> +++ b/drivers/tty/serial/max3100.c
> @@ -16,6 +16,7 @@
>  /* 4 MAX3100s should be enough for everyone */
>  #define MAX_MAX3100 4
>  
> +#include <linux/bitops.h>
>  #include <linux/container_of.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
>  	else
>  		c &= 0xff;
>  
> -	parity = parity ^ (hweight8(c) & 1);
> +	parity = parity ^ parity_odd(c);

This can be simplified for more unless I misunderstand something...

From: Yury Norov <yury.norov@gmail.com>
Date:   Wed Apr 9 13:22:04 2025 -0400

serial: max3100: Replace open-coded parity

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index f2dd83692b2c..07d332b8e87d 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -121,20 +121,12 @@ static DEFINE_MUTEX(max3100s_lock);		   /* race on probe */
 
 static int max3100_do_parity(struct max3100_port *s, u16 c)
 {
-	int parity;
-
-	if (s->parity & MAX3100_PARITY_ODD)
-		parity = 1;
-	else
-		parity = 0;
-
 	if (s->parity & MAX3100_7BIT)
 		c &= 0x7f;
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
-	return parity;
+	return s->parity & MAX3100_PARITY_ODD ? !parity(c) : parity(c);
 }
 
 static int max3100_check_parity(struct max3100_port *s, u16 c)
