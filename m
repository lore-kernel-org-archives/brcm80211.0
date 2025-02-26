Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAFA2EB02
	for <brcm80211@lists.linux.dev>; Wed, 26 Feb 2025 18:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740594803; cv=none; b=E3m/JhJd6NAesW+5Ib+JeeGTybW4ohI6xXAaHKlRmkaVxzQIu/h5y/AVlnjCueTWqJJw3k6QZcxfmvi1ioBYNyXfg7EM1AgacdelWZkbSo1Nm4GOxRvNjDpqzN+r2Q9BlKczobFFRXWk6xRgmZsXZa+9gG5CAKDSLmFIeaLlIng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740594803; c=relaxed/simple;
	bh=06Bx46w4WKqnLcEDcMImX2Rgvc4s7Az8+qGa2ZiH2i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K38H0bpA7GUHZm+YgoSnrBVQWzcsdFAMJkRgQKd4lJWwfLmRhqQnh6Vmr8wZ8hBN7GLT/yirWstq6yPjd9m16u78NyvG6TG0X9XA+mcDlxQoJ9zdcn/BszewItxfDTlk1OZiu1O+eKHf9GYNSkGJ7gW+gfbTPs4LHb8/UKz1kXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FePdT0Wr; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FePdT0Wr"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so257568a91.2
        for <brcm80211@lists.linux.dev>; Wed, 26 Feb 2025 10:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740594801; x=1741199601; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8NV8NW5Mq8hnlsfnK7VYLX7Lb9iIPf134td0bPOEzZY=;
        b=FePdT0WrEKls4ZVL/NSE2ZIRzBM4zhbpCmv4eRBA6VFYBjtytUUfcNphUMv3/JHSfX
         0RN4zirul1bBSsfYN2VARYqaISCMyqYmclM6k0nIGFXE/BkBrGuNBYL8QrEX4hl7b0gU
         JR9now2C8OeQyzx78RSqn+CxLwGV9DsYTl2ho4ZhT24YELSapyqGRO7uZBrH8t4Uz4zR
         yoNQBWyEUdpRhV/UfseOnCffdWKS/tPYpwne7P256IXCSo8qsaxh9VU8suUkMvbv1EJi
         sh5gm0jVNwjNFdJA1KQVeP5r5l8oHsrgr/XzEDPUKZv6zGZCIYRodUg4myKWIb2xJBgG
         YRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740594801; x=1741199601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NV8NW5Mq8hnlsfnK7VYLX7Lb9iIPf134td0bPOEzZY=;
        b=eS9UQXa8eeEROoX+t5s2o6Mb0zhBczTwU0QYsXGu3bhnc5oa4CrFpHJbpcvnld0fRq
         YenVXZIX3DgsFlJNsW76ab+vRSsJhjDtx4JKgbfCRLvQMF2rIH4kTTLjYRGwOBIVyv8o
         yFNiXFoFkPtMaTeXEcGzEdEOc70ILraG4NyTWbrjoEz6EipCBVI/K6tmiWJQL0QPB400
         M9j5LxJfisxY98LAyi9Zk957810Oo213xhI9Mu68aCgntQki3DcokFkGU4A9Na+7ae9r
         HC23MsMw9mm/mP7+FRQkDzp589ohimp/udXTwFNhYRwlXTlwA5LVy/8Yt4kuwX0WPLT6
         LKng==
X-Forwarded-Encrypted: i=1; AJvYcCURDv0bLaafn2V2Nkp4gNyhOIANDn1W4NZGy6vnfVVIReFhbHrG6Z7mBaBvQSbTOJLlFFSIxqs80DU=@lists.linux.dev
X-Gm-Message-State: AOJu0YztTlINi+9/LGPp1C0Sc6IkXLr/es5J3d/qa5S1s3eCHKnYxUxF
	cb77eC3/pTtkfdLW39qQINk9GuljCNEgJztceqYxywwo9V7DpiLh
X-Gm-Gg: ASbGnct43iKzoQfE898Knsrp3tdRklyEkWczNmehTvNSlPDM87yNv4cyH0hYq7+f6yu
	N1QdXML6FviqCrdJYXJ8wkr7gx1NXlatUfFty/MgOVqqeB26diKi2kxuVJZss6J4A0N6Md4AaXR
	E+TgvYIPvx7TU3nlR2UPC33QusoXhWOkdpX1+h8uGJFvIH3hcE1nBdljiNbyllcu/6rjnLWP7fd
	mksDTmtKWG4/VUUmMQmMXDnVWlo2rJn7v3dMv0MT8DFLY4Av1phiV7md4bLWfqYDOUaLm8ury2U
	s6rFMPHSliv8lxlzExaRpwBP+hga+kDY4qjT0FFr5laQ/fyDig==
X-Google-Smtp-Source: AGHT+IEhO/8zynHAj/XQ8CfYcqOsDet7/XXIGYhA3zqO2mHTqzuioBsUax6Pz3NWu+JgRkwDnM6ajg==
X-Received: by 2002:a17:90b:2d88:b0:2ee:c918:cd60 with SMTP id 98e67ed59e1d1-2fe7e33d442mr6780868a91.20.1740594801403;
        Wed, 26 Feb 2025 10:33:21 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825eb82fsm1917776a91.32.2025.02.26.10.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 10:33:20 -0800 (PST)
Date: Wed, 26 Feb 2025 13:33:18 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
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
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z79ebv630yuNOJKV@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
 <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>

On Wed, Feb 26, 2025 at 08:14:14AM +0100, Jiri Slaby wrote:
> On 25. 02. 25, 14:29, Kuan-Wei Chiu wrote:
> > > +#define parity(val)					\
> > > +({							\
> > > +	u64 __v = (val);				\
> > > +	int __ret;					\
> > > +	switch (BITS_PER_TYPE(val)) {			\
> > > +	case 64:					\
> > > +		__v ^= __v >> 32;			\
> > > +		fallthrough;				\
> > > +	case 32:					\
> > > +		__v ^= __v >> 16;			\
> > > +		fallthrough;				\
> > > +	case 16:					\
> > > +		__v ^= __v >> 8;			\
> > > +		fallthrough;				\
> > > +	case 8:						\
> > > +		__v ^= __v >> 4;			\
> > > +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > +		break;					\
> > > +	default:					\
> > > +		BUILD_BUG();				\
> > > +	}						\
> > > +	__ret;						\
> > > +})
> > > +
> > > +#define parity8(val)	parity((u8)(val))
> > > +#define parity32(val)	parity((u32)(val))
> > > +#define parity64(val)	parity((u64)(val))
> > What do you think about using these inline functions instead of macros?
> > Except for parity8(), each function is a single line and follows the
> > same logic. I find inline functions more readable, and coding-style.rst
> > also recommends them over macros.
>
> Not in cases where macros are inevitable. I mean, do we need parityXX() for
> XX in (8, 16, 32, 64) at all? Isn't the parity() above enough for everybody?

The existing codebase has something like:

        int ret;

        ret = i3c_master_get_free_addr(m, last_addr + 1);
        ret |= parity8(ret) ? 0 : BIT(7)

So if we'll switch it to a macro like one above, it will become a
32-bit parity. It wouldn't be an error because i3c_master_get_free_addr()
returns an u8 or -ENOMEM, and the error code is checked explicitly. 

But if we decide to go with parity() only, some users will have to
call it like parity((u8)val) explicitly. Which is not bad actually.

> And if not, you can have all those parityXX() as inlines as you suggest, but
> also provide a macro such as the above to call (optimized) parityXX() as per
> datatype len.

Yes, if we need fixed-type parity's, they should all be one-liners
calling the same macro. Macros or inline functions - no preference for
me.

Thanks,
Yury
