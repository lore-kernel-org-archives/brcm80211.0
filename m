Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144422638B4
	for <brcm80211@lists.linux.dev>; Mon,  3 Mar 2025 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741020882; cv=none; b=ianjp+qFZ2G+O7ncM0btA3eFruDAhI3xhHdmS+soiDx/jk7Y18ERnr1i2PqWX8EPyZnOnYLAWRXDZLqLyxv4+qImSKic2il81OuWJvAy1xFXJYZ/dQWHW8q6POeW3qvYUOF2+VhW2VqYSdRtiyPFhKorUZIbLzFs7QddpV9pjnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741020882; c=relaxed/simple;
	bh=kkvFR/IJHbl0LGFDEze2MZjviEc4qGy5WgIJZLMUixA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UM2hMTvux1Kz7kbHpLXBdCWO2qMO5ObfJs8mF0MOOwaiRUX8cheansBVnd29IXWFcLS/y1NuoEy2l4q00BgHMYTjBgDRChAc0oda7xFdkqxR8HOG+MEIFAZ/IhjRE6ovmTqM/9FMVK/0ynnNlVpG8b0BYavnI2d74S3OIvXQfKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0ORY/Cu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0ORY/Cu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2239c066347so30745125ad.2
        for <brcm80211@lists.linux.dev>; Mon, 03 Mar 2025 08:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741020880; x=1741625680; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snQ/FfGFpVYJtbb054yayRa/GPJB9+XLRVNWjcRf72o=;
        b=C0ORY/Cu4e7Z5WXmhNe3uW4yxB14q0k6vcZ/lFhIv9A+njenbenrEhftOyTTy78kSH
         TuGhtJl7XoO1hsvZmUWlv7VJE2bLhyU9jouNvyCZ/INlDGb7siypuXGZSrRbyDBe+lZT
         yAUahe23EPuMXJ7vv6AndPYAOqAGYR6KqsBuEP4z4gx7LIZUqK+VbnwEiMDLlzBj/ukT
         Ivsh9WQ5zgvvAxsT389blPKnVYLz8tfT0eZEZB5fFMAYqutkyzeI5TsoCdhK8u1r1t56
         j2rVTiLaI+71OrHHJ3QgllVUgFJg14hk4+1yOleoh2c8zLRqcxGFmOnBKU6ASZtoZbYN
         +Bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741020880; x=1741625680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snQ/FfGFpVYJtbb054yayRa/GPJB9+XLRVNWjcRf72o=;
        b=Wtah8CTfJ8lmkg2uJ/gWrsVkQTDIiS/ORtYpSnsV2P/4UEwBr7g+KcqbQ0m/1fur/V
         nrrX3Rb5Lb7tkENM2XiuJlL/Hy57Vr+pVu1T5NgrvDg7B4AHPbwnMKDoQ4HUrTau2/6U
         VlimdHv6SgTieL5J5yxvSIsN1wRODZVvphBefqfqS0Gw68lCouzdbksEq7oRb4YetSL6
         eLlQbrMtnTtD84KyQGGkEWM6ZPkkEDnmcuZ0smmy8ctS3a18XHe8Wjfwkvm+JkDl8uSS
         08tjYiQM6mHGqdwStcDRxiUU9XAPz2N2izMaOUuVJYKKsLKtBYpDrjWlHU3AMigdFWb6
         punw==
X-Forwarded-Encrypted: i=1; AJvYcCXIAnvYuCM5BguUM8D60R3mPpO3XlYB0iX9KHZ9uwvxwR4FA+xVnwL07kP99e59PTaAZ7KxCNzXZGU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOuMU/i9oNyjdqLGmLvsLEWWwRE8SInRLjb8VZgnp5vwd/bPNO
	19wHjcNTDy1SxlAVnqiYTrjihrp1x3xhsjLzB5pJRW8ITLASg8h6
X-Gm-Gg: ASbGnctsCuZBsbGn7YND+ZJ49i998B+PUKZrm8CxlTJW3Ch+nv+53luhNTbY2GZCZVx
	Rn0lQgPpAlGYJrnUBBZow8D++GSbt2fI/RsMPYJtkE9DIIqPqFoaXRdzYbhABN/elZg4aB6SQYK
	E2Te0HDS3Wqw9C6EftgmTB+EA4MAJC7WMw/pD0Y7Cah7aBW/HYM+7UBj00UQrqsaVP14qFQPaqq
	ebXVq/Aqg4BTI19xC/VxM6nDox58MVB409uAi8OoDGC5f0pmQOgwc/ylMibShw9mWe9J15VWzpS
	RxUqk/3/DAP3PFpzfm0Pj5CnzT8DI/R87iiSVaanrWeCKVFJv6uqvOlKBiYeg3i92UJNqYMX
X-Google-Smtp-Source: AGHT+IERzXXFV1wY4JOTqL7FEPHOnAzKcBtkbh1MW/f1V7zUkt/V5lVcottzvfcf37UkL0y23/7mVg==
X-Received: by 2002:a17:902:fc8d:b0:223:44dc:3f36 with SMTP id d9443c01a7336-2236925eef4mr232091065ad.43.1741020880198;
        Mon, 03 Mar 2025 08:54:40 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c59ecsm80088085ad.123.2025.03.03.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 08:54:39 -0800 (PST)
Date: Tue, 4 Mar 2025 00:54:30 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, tglx@linutronix.de,
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
	andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8XexgomsveMWK2U@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
 <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
 <Z8XOF2DMMRKqam6R@thinkpad>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8XOF2DMMRKqam6R@thinkpad>

On Mon, Mar 03, 2025 at 10:43:28AM -0500, Yury Norov wrote:
> On Mon, Mar 03, 2025 at 10:47:20AM +0800, Kuan-Wei Chiu wrote:
> > > > #define parity(val)					\
> > > > ({							\
> > > > 	__auto_type __v = (val);			\
> > > > 	bool __ret;					\
> > > > 	switch (BITS_PER_TYPE(val)) {			\
> > > > 	case 64:					\
> > > > 		__v ^= __v >> 16 >> 16;			\
> > > > 		fallthrough;				\
> > > > 	case 32:					\
> > > > 		__v ^= __v >> 16;			\
> > > > 		fallthrough;				\
> > > > 	case 16:					\
> > > > 		__v ^= __v >> 8;			\
> > > > 		fallthrough;				\
> > > > 	case 8:						\
> > > > 		__v ^= __v >> 4;			\
> > > > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > > 		break;					\
> > > > 	default:					\
> > > > 		BUILD_BUG();				\
> > > > 	}						\
> > > > 	__ret;						\
> > > > })
> > > 
> > > I'm seeing double-register shifts for 64bit values on 32bit systems.
> > > And gcc is doing 64bit double-register maths all the way down.
> > > 
> > > That is fixed by changing the top of the define to
> > > #define parity(val)					\
> > > ({							\
> > > 	unsigned int __v = (val);			\
> > > 	bool __ret;					\
> > > 	switch (BITS_PER_TYPE(val)) {			\
> > > 	case 64:					\
> > > 		__v ^= val >> 16 >> 16;			\
> > > 		fallthrough;				\
> > > 
> > > But it's need changing to only expand 'val' once.
> > > Perhaps:
> > > 	auto_type _val = (val);
> > > 	u32 __ret = val;
> > > and (mostly) s/__v/__ret/g
> > >
> > I'm happy to make this change, though I'm a bit confused about how much
> > we care about the code generated by gcc. So this is the macro expected
> > in v3:
> 
> We do care about code generated by any compiler. But we don't spread
> hacks here and there just to make GCC happy. This is entirely broken
> strategy. Things should work the other way: compiler people should
> collect real-life examples and learn from them.
> 
> I'm not happy even with this 'v >> 16 >> 16' hack, I just think that
> disabling Wshift-count-overflow is the worse option. Hacking the macro
> to optimize parity64() on 32-bit arch case doesn't worth it entirely.
> 
> In your patchset, you have only 3 drivers using parity64(). For each
> of them, please in the commit message refer that calling generic
> parity() with 64-bit argument may lead to sub-optimal code generation
> with a certain compiler against 32-bit arches. If you'll get a
> feedback that it's a real problem for somebody, we'll think about
> mitigating it. 
>
How about reconsidering using parity8/16/32/64() instead of adding a
parity() macro? They allow compiler to generate correct code without
any hacks, and each implementation is simple and just one line. Jiri
also agreed in the previous thread that we need parity8() in cases like
the i3c driver. I think this might be the easiest solution to satisfy
most people?

Regards,
Kuan-Wei
