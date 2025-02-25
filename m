Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE926770B
	for <brcm80211@lists.linux.dev>; Tue, 25 Feb 2025 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740493239; cv=none; b=Luv/AeWqj5EhGBawPlX/gbEeCxy3bHZb1rrfNi7YWUl5TX12nMJRTfAJdKrdHVdv1I5Lm+1BSLZXHIyZEdEevz2CQkj9GCXeJRGPNE5QQcDKTY/q5w0VAZoNGikHKeQsY0ul6AmlNsEcotdZYCARL4P2tjLHR/wwOMSSksYwsKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740493239; c=relaxed/simple;
	bh=igL96eUEZrEr7nXbYX4xSAi+Is+y1+sZ4i8SGsdn+rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFX/iqEZGgV018mmTvOmgvjtsxvSjMbo3HLL7wFjFrouNeSLhIMykrUQhgH8Fe5QYCnwSNQpPKQ5DExm0yXeMq2RzURIJafkufKqdsPXyX941X0rDwFIr4GbfvUyUSc1drsRxEZnkp9zPDcUGUeuAm+hF0JYCFjoYjC6dmln82o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRQMlIoE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRQMlIoE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2211cd4463cso114584305ad.2
        for <brcm80211@lists.linux.dev>; Tue, 25 Feb 2025 06:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740493237; x=1741098037; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pH6kCz8lTpjp3q7JFqjKA+FgBtUVtLCpjnGefR5mF5k=;
        b=SRQMlIoEisOAPwfRbl7J9AYBqHTYpTLQ41TMsTYQZxFkWDB2pMyhKvHHit+zOECezY
         tcy90HSGzBDg+2+F9p2caShZUniaaTFu6s7GlUyv5giN1E+T07CLzcZl29U0OYA1N3Go
         0QRXOzzOliV7fthtSIPNh6aWZQNxXayoMhFmYDr/F3ocytHnuhia1TFi0LB9xhmJQyOL
         1dbaZGSe3C4qa3er/0umccYo7DcFOY3gAfDYi7xv3v9Ta/meR7zvd2tspAE60VYFpC1Q
         c2YurqIt52vN1JRkLuPQDGG+v8NOWq8mhlWa+bRIcX/rPVQHKboHiThn1EQM7ADm05gx
         WjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493237; x=1741098037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pH6kCz8lTpjp3q7JFqjKA+FgBtUVtLCpjnGefR5mF5k=;
        b=dPQNm6121XLAKtSpKLlSqB3XUuGP3lg/oqSj38OOf0o1bpNCznvLPn13vuDdwrDr5S
         Z4uPn51lUbns5+hIebs7UE5h6WpJTCb5VtAAW2ZXg2IO8rG93OgUTj2EpIcCqAGY+maq
         Q/6Da754uhT5VYdlxVBy9QLvS+zaYE+qFBm518ayuM0DyWk17o8/XKRkzQNyWMTHiNEJ
         YQh5dwrkRm26BHsLhP0PBlswVSE6tIn4SfboK2SJcz6VyrqHcjkRjxl+qqD8wcgVeBvr
         AwnDEtTuw3lIFr7U/fvPCIivPysbwmyaiucLAx6eo1uDo1u6QxdVCcX0MvHE4OT3Jy71
         ZgIg==
X-Forwarded-Encrypted: i=1; AJvYcCUK5XetVL1efvVbiXjMrTzzjTiHKrvbq+ZOCt+jr1G+UQqlwKI/zCS4y4GUk2hggKq4suRYxUHz0Ug=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg907w0HCtoQ3U4s2XVv55m9OsxYQ57t89al3luDqMOoigm81V
	fyBvdjcu3IDalVz3roh2PgN5SV2U4EJtLNw94ZIouuCHg2q+a+6H
X-Gm-Gg: ASbGncuhzQEiEoViQenYQlyZOZH+1vAxmy7HEKDrpPso/u3MSOaxWGID1Z/19xmoLdH
	lhYikdGtCwhOL3xg6/t1KGdtBOEnDQo4ftW8KAvaZ65pU1a86ztsPLbuGVQNy0mgCqRrluEy4iF
	5ZgL499maCbrSI0P8PWv6X5gx3QAvdXQXfhDlEcR961e6SqK7jvAh25osDd6zN6gC0ntf1XFNxQ
	AjnPSPVvK9IrzkzVRL+uby2vK1GMa1Pj/jL2s9ujvyuVlizW0OboOxJof50TRKyY4eXV9L2cZV7
	kk5joSBIARNNBpGKNguWnqN09Q/QG94fKUoacDnGBnA7c8SS4ZeLqg==
X-Google-Smtp-Source: AGHT+IF5xwcyMuEse5d6U24DTrm7La/i/EXLcWUjTbDTBaLHgklr2LYp0Shxn4PZ0SRkVV82FkT4WQ==
X-Received: by 2002:a05:6a00:3392:b0:730:9946:5973 with SMTP id d2e1a72fcca58-734790a2af5mr5118831b3a.5.1740493236834;
        Tue, 25 Feb 2025 06:20:36 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a72ef60sm1586035b3a.75.2025.02.25.06.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:20:36 -0800 (PST)
Date: Tue, 25 Feb 2025 22:20:26 +0800
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
	jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z73RqnMRS+31wzrv@visitorckw-System-Product-Name>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>

On Tue, Feb 25, 2025 at 09:29:51PM +0800, Kuan-Wei Chiu wrote:
> Hi Yury,
> 
> On Mon, Feb 24, 2025 at 02:27:03PM -0500, Yury Norov wrote:
> > On Mon, Feb 24, 2025 at 12:42:02AM +0800, Kuan-Wei Chiu wrote:
> > > Several parts of the kernel open-code parity calculations using
> > > different methods. Add a generic parity64() helper implemented with the
> > > same efficient approach as parity8().
> > 
> > No reason to add parity32() and parity64() in separate patches
> 
> Ack.
> 
> >  
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > >  include/linux/bitops.h | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > > index fb13dedad7aa..67677057f5e2 100644
> > > --- a/include/linux/bitops.h
> > > +++ b/include/linux/bitops.h
> > > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
> > >  	return (0x6996 >> (val & 0xf)) & 1;
> > >  }
> > >  
> > > +/**
> > > + * parity64 - get the parity of an u64 value
> > > + * @value: the value to be examined
> > > + *
> > > + * Determine the parity of the u64 argument.
> > > + *
> > > + * Returns:
> > > + * 0 for even parity, 1 for odd parity
> > > + */
> > > +static inline int parity64(u64 val)
> > > +{
> > > +	/*
> > > +	 * One explanation of this algorithm:
> > > +	 * https://funloop.org/codex/problem/parity/README.html
> > 
> > This is already referenced in sources. No need to spread it for more.
> 
> Ack.
> 
> > 
> > > +	 */
> > > +	val ^= val >> 32;
> > > +	val ^= val >> 16;
> > > +	val ^= val >> 8;
> > > +	val ^= val >> 4;
> > > +	return (0x6996 >> (val & 0xf)) & 1;
> > 
> > It's better to avoid duplicating the same logic again and again.
> 
> Ack.
> 
> > 
> > > +}
> > > +
> > 
> > So maybe make it a macro?
> > 
> > 
> > From f17a28ae3429f49825d65ebc0f7717c6a191a3e2 Mon Sep 17 00:00:00 2001
> > From: Yury Norov <yury.norov@gmail.com>
> > Date: Mon, 24 Feb 2025 14:14:27 -0500
> > Subject: [PATCH] bitops: generalize parity8()
> > 
> > The generic parity calculation approach may be easily generalized for
> > other standard types. Do that and drop sub-optimal implementation of
> > parity calculation in x86 code.
> > 
> > Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > ---
> >  arch/x86/kernel/bootflag.c | 14 +-----------
> >  include/linux/bitops.h     | 47 +++++++++++++++++++++++++++-----------
> >  2 files changed, 35 insertions(+), 26 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> > index 3fed7ae58b60..4a85c69a28f8 100644
> > --- a/arch/x86/kernel/bootflag.c
> > +++ b/arch/x86/kernel/bootflag.c
> > @@ -2,6 +2,7 @@
> >  /*
> >   *	Implement 'Simple Boot Flag Specification 2.0'
> >   */
> > +#include <linux/bitops.h>
> >  #include <linux/types.h>
> >  #include <linux/kernel.h>
> >  #include <linux/init.h>
> > @@ -20,19 +21,6 @@
> >  
> >  int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
> >  
> > -static int __init parity(u8 v)
> > -{
> > -	int x = 0;
> > -	int i;
> > -
> > -	for (i = 0; i < 8; i++) {
> > -		x ^= (v & 1);
> > -		v >>= 1;
> > -	}
> > -
> > -	return x;
> > -}
> > -
> >  static void __init sbf_write(u8 v)
> >  {
> >  	unsigned long flags;
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index c1cb53cf2f0f..29601434f5f4 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -230,10 +230,10 @@ static inline int get_count_order_long(unsigned long l)
> >  }
> >  
> >  /**
> > - * parity8 - get the parity of an u8 value
> > + * parity - get the parity of a value
> >   * @value: the value to be examined
> >   *
> > - * Determine the parity of the u8 argument.
> > + * Determine parity of the argument.
> >   *
> >   * Returns:
> >   * 0 for even parity, 1 for odd parity
> > @@ -241,24 +241,45 @@ static inline int get_count_order_long(unsigned long l)
> >   * Note: This function informs you about the current parity. Example to bail
> >   * out when parity is odd:
> >   *
> > - *	if (parity8(val) == 1)
> > + *	if (parity(val) == 1)
> >   *		return -EBADMSG;
> >   *
> >   * If you need to calculate a parity bit, you need to draw the conclusion from
> >   * this result yourself. Example to enforce odd parity, parity bit is bit 7:
> >   *
> > - *	if (parity8(val) == 0)
> > + *	if (parity(val) == 0)
> >   *		val ^= BIT(7);
> > + *
> > + * One explanation of this algorithm:
> > + * https://funloop.org/codex/problem/parity/README.html
> >   */
> > -static inline int parity8(u8 val)
> > -{
> > -	/*
> > -	 * One explanation of this algorithm:
> > -	 * https://funloop.org/codex/problem/parity/README.html
> > -	 */
> > -	val ^= val >> 4;
> > -	return (0x6996 >> (val & 0xf)) & 1;
> > -}
> > +#define parity(val)					\
> > +({							\
> > +	u64 __v = (val);				\
> > +	int __ret;					\
> > +	switch (BITS_PER_TYPE(val)) {			\
> > +	case 64:					\
> > +		__v ^= __v >> 32;			\
> > +		fallthrough;				\
> > +	case 32:					\
> > +		__v ^= __v >> 16;			\
> > +		fallthrough;				\
> > +	case 16:					\
> > +		__v ^= __v >> 8;			\
> > +		fallthrough;				\
> > +	case 8:						\
> > +		__v ^= __v >> 4;			\
> > +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > +		break;					\
> > +	default:					\
> > +		BUILD_BUG();				\
> > +	}						\
> > +	__ret;						\
> > +})
> > +
> > +#define parity8(val)	parity((u8)(val))
> > +#define parity32(val)	parity((u32)(val))
> > +#define parity64(val)	parity((u64)(val))
> >  
> What do you think about using these inline functions instead of macros?
> Except for parity8(), each function is a single line and follows the
> same logic. I find inline functions more readable, and coding-style.rst
> also recommends them over macros.
> 
> Regards,
> Kuan-Wei
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index c1cb53cf2f0f..d518a382f1fe 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -260,6 +260,26 @@ static inline int parity8(u8 val)
>  	return (0x6996 >> (val & 0xf)) & 1;
>  }
>  
> +static inline parity16(u16 val)
> +{
> +	return parity8(val ^ (val >> 8));
> +}
> +
> +static inline parity16(u16 val)
> +{
> +	return parity8(val ^ (val >> 8));
> +}
> +
> +static inline parity32(u32)
> +{
> +	return parity16(val ^ (val >> 16));
> +}
> +
> +static inline parity64(u64)
> +{
> +	return parity32(val ^ (val >> 32));
> +}
> +
>  /**
>   * __ffs64 - find first set bit in a 64 bit word
>   * @word: The 64 bit word
> 
>
Oops... I made a lot of fat-finger mistakes. Here's the correct one.

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..427e4c06055e 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -260,6 +260,21 @@ static inline int parity8(u8 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+static inline int parity16(u16 val)
+{
+	return parity8(val ^ (val >> 8));
+}
+
+static inline int parity32(u32 val)
+{
+	return parity16(val ^ (val >> 16));
+}
+
+static inline int parity64(u64 val)
+{
+	return parity32(val ^ (val >> 32));
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word


> >  /**
> >   * __ffs64 - find first set bit in a 64 bit word
> > -- 
> > 2.43.0
> > 
