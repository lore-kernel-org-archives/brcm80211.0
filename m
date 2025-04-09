Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF9E1D5147
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223464; cv=none; b=T5crTIZPMntZLCA7kjYOrUmRSFGQv5zQD0pJOxr89yAdEQVkV68Eyf7bsGqOHP4q/qU3N+UWerL0I2SG8ucuGjQLjLXQFMNwOjthxcdRr71DUoZ00Ku3IPcCAcD6hZxSWcJSBVyVh99aOpEsxBEwuDUVawet2Kjww5O+WX2uAzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223464; c=relaxed/simple;
	bh=YU9+Qliy0QOX2sgsuyWGCNBJntINoefQp4KfR0TS7Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRszfdWfpfonOkCNZVSYKMPu6rCgFHfKMLuizgdAXkEAounOoamyjeIjhk4EtCAlfemRQcOmj25nnLW39IxFpnCrhRWk/OBoAVX27ul3HgRbmWx237oZ2d/e8yxd3jsd7TK8VxOduSRpX9GpijdKep4ki4QeIBjU92N/tA3exw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQP6AKJA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQP6AKJA"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so4373447a91.3
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 11:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744223462; x=1744828262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yWp8HcqQEiUK9VmrP5Fyuyk5glVIpEEzW3GEoFZN0j0=;
        b=mQP6AKJAeT48qGdl21QwXVaFItNcGeB9KZM1uHFORA0TFzl+AxOXOF/zDijpxLMBao
         k/zuMkyglLhoIHTvfi9jibjSw/xdt73HWuLsjKH4GQWnGH1rnr30Ln22KvcVMpqVFqcB
         TmQe7LSycT+A0tTkARcWqu4huv1WmBnpd3cA4JOG54fb49O4QQMvNDxCcj2xdjFiePcQ
         01ryDrL3fCEuv6toqS45OWh8P6C6yZ8oid5HGVcelX+HNuHQ7QElncol1f+80l9KjW5w
         PPAg2weXeDkUSQyG2P7S8uYSv7YD9VNZziEsunKURuUug9jHHiAv1YNQ9mhYPxdgiJML
         mCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223462; x=1744828262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWp8HcqQEiUK9VmrP5Fyuyk5glVIpEEzW3GEoFZN0j0=;
        b=Q5Jcp9Zz+9On1AOxWj6iCEy+bhKTx+OPLMjlUeCgP/qNZd1BcAgTEJdoQ/Q8XMWYxt
         6uLHg8KYnDOMccln6J7479XrF7ti+igAw0HUXVyr53AGuNVZSL64r5E6eblZ5fDc+vN9
         xlje7n62aNuYgF9a3IW12kodzSPmpr13vkKQ8I7vr2Ia/JCtqVocbV+zmzT65eLgFbZK
         Cd5aoYgesamxoA0bawIIOrBqwGyqNYuj3tH+RcxNUBBqYpDHb8hu3OnO700jHGuOEH/V
         Bsg+Vwm3eQBzhQ/Dz97VF6/rL1RMn8jUp3X1Mmi+3InDdVVY52enF62NPlIQrdOilTrf
         bUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHZ8rTZ2iUlQcT0LapyH90wpCriOVt5xVQtGTltlpM3BwU8wx5lE+Hv0FdQqcfVE87KFEoIBPVdF0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9ujUnIX2cpWlFgAPFnFRtfuWaBw7QLc2vjJlDa9mGyz+uLMXq
	lmpCcPJubNvsTLaeYdHEnlDjgBjYBkDArNyGmb/TBkNId4yi44QY
X-Gm-Gg: ASbGncsnh8iXH9IK70+3PPPvTVoJl1TCElko0IMqJcfrljEEJNaSQcchNnf8FMPMHH4
	S7KDZV+NevzJMgOyfmEZf34ruDem5fWXZNhQIMEjCYWy69UMbRTuHaVeBzMqpeqRbmMWuaHn9mm
	Bntid52fZP445bNLOqJ3YuYD4h7Q9BlskmysuAZ1V9BEuQqVg+krSKDHgPcxDsVPW5fq7BQdqBe
	eBOrrDPqAx+FClcA4LGYJRm3q0RuNU778Ye4U7TY9tiggFqjZUlq7BNKdYbmNx6v7wkKzyM9C27
	uF2En+PUzmqwf8A8Fl6wdwrctNtz7JayQBWSD7ucAkT+3hHL+r56f01D7F1Cqpjj9tVf
X-Google-Smtp-Source: AGHT+IEojffDEHS0j3whbiNP8KyNCEs3sfRNMc8qkUsRgVj5cXjPuj6Pe0BT8ErsKVVmpVlb9KZMXw==
X-Received: by 2002:a17:90b:548b:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-306dd5789bbmr4467876a91.31.1744223461782;
        Wed, 09 Apr 2025 11:31:01 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306eaec023asm436047a91.33.2025.04.09.11.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:31:01 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:30:50 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
Message-ID: <Z/a82sdjEDaqE9v0@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-6-visitorckw@gmail.com>
 <Z_atODqZDkff5sjj@yury>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_atODqZDkff5sjj@yury>

On Wed, Apr 09, 2025 at 01:24:08PM -0400, Yury Norov wrote:
> On Wed, Apr 09, 2025 at 11:43:48PM +0800, Kuan-Wei Chiu wrote:
> > Refactor parity calculations to use the standard parity_odd() helper.
> > This change eliminates redundant implementations.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  drivers/tty/serial/max3100.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
> > index f2dd83692b2c..36ed41eef7b1 100644
> > --- a/drivers/tty/serial/max3100.c
> > +++ b/drivers/tty/serial/max3100.c
> > @@ -16,6 +16,7 @@
> >  /* 4 MAX3100s should be enough for everyone */
> >  #define MAX_MAX3100 4
> >  
> > +#include <linux/bitops.h>
> >  #include <linux/container_of.h>
> >  #include <linux/delay.h>
> >  #include <linux/device.h>
> > @@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
> >  	else
> >  		c &= 0xff;
> >  
> > -	parity = parity ^ (hweight8(c) & 1);
> > +	parity = parity ^ parity_odd(c);
> 
> This can be simplified for more unless I misunderstand something...
> 
I usually don't change the existing coding style since each subsystem
may have its own preferred style.  

But yeah, if this is the preferred way, I can make this change in the
next version.

Regards,
Kuan-Wei

> From: Yury Norov <yury.norov@gmail.com>
> Date:   Wed Apr 9 13:22:04 2025 -0400
> 
> serial: max3100: Replace open-coded parity
> 
> diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
> index f2dd83692b2c..07d332b8e87d 100644
> --- a/drivers/tty/serial/max3100.c
> +++ b/drivers/tty/serial/max3100.c
> @@ -121,20 +121,12 @@ static DEFINE_MUTEX(max3100s_lock);		   /* race on probe */
>  
>  static int max3100_do_parity(struct max3100_port *s, u16 c)
>  {
> -	int parity;
> -
> -	if (s->parity & MAX3100_PARITY_ODD)
> -		parity = 1;
> -	else
> -		parity = 0;
> -
>  	if (s->parity & MAX3100_7BIT)
>  		c &= 0x7f;
>  	else
>  		c &= 0xff;
>  
> -	parity = parity ^ (hweight8(c) & 1);
> -	return parity;
> +	return s->parity & MAX3100_PARITY_ODD ? !parity(c) : parity(c);
>  }
>  
>  static int max3100_check_parity(struct max3100_port *s, u16 c)
