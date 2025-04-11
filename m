Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649AD20F08E
	for <brcm80211@lists.linux.dev>; Fri, 11 Apr 2025 16:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744389278; cv=none; b=blYxqxpooi3mZF2hp8ztxDWGC54qjscYcHZoi47UkKHVMoyVyZv7L7wTysJkO7fF6yQZlIYWfPlTUoDRHKbXoOmzxuwVjApegQAr8lQMgKaJ6ARIWjHKY6mPXXtSf6O1AVB+8WOtROSAUzhrZgVcAgLrMqzmcqdo168tOKAvMI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744389278; c=relaxed/simple;
	bh=TPsDNdO0J5tFY3gM6ug4IFFbTqGLVdNs3Fa7k4whx34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFNnwUi87wgH6V5KAHM03eH//r8Qjb5urhQvHuATDmqhMn3chA8qDb/LCfH1LxxLN1FTSVmxBDk0wGepHRbQKv/0Dyi9t4EL8vJEvGMJe1WtuDS7SDSbemWIFWH6IbJdAXc48X2XTP5QBrYo1p/AYt5AhCW9tgmnqr/A1pUdW0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNnPh9Zy; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNnPh9Zy"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so1675756b3a.2
        for <brcm80211@lists.linux.dev>; Fri, 11 Apr 2025 09:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744389275; x=1744994075; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i2OP7V+QE6E9gg3GbdLcYE8UHgSFfj9Jnjg73a7+53s=;
        b=JNnPh9ZyIFGMSzGlcepQppwY0aeXZfwbkUeOo3dLf0uWNyyifELDc8noq3NeHZabo9
         z47TaHpz1T/XtyiUwYIbhpJyvcjemOHXq/E3DndwVysxOIKjC1aQ5YjfN7QoqkxM75Wp
         j07WCkBEdEjjzrNfa9Zl6BLfKUwniTlGcgmi4wp1bVz2YVbq8aee0AQaop63G2Z/W7Mm
         uZDlWAi6m9dk5MmLY6CZTnZmqF2vaFaRXZh6vECboRwVFPf9RV3Ia29R6lYpBt/n3fge
         3zgdcOkLTXIIvfJlB51wo/Jlna963ICot8MVRchf8xViZNV81yfsmiA/h3+EKF+bbNwQ
         v+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744389275; x=1744994075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2OP7V+QE6E9gg3GbdLcYE8UHgSFfj9Jnjg73a7+53s=;
        b=jiGq21T+Wk2I2ytEKnCEIqC+AAlnwzwpZC56im/PH6thpSq6FEPb02sqYG6J1cxdrx
         rypo+xl/bfMdSj1s1LMM5uRGpZjDBem9c3IDgBZ4JgQIGxVwyAeRdxKe3iau9VDT+ALS
         mmD+Mi5aevWvS0BmBkngTsWK+ADD7NbjabWw2B5VJ2HOve2GYednOrz3gCOoqRHNct4S
         R10vwSaHLwWm6oTiW9vUKhuXDaGo7iwICCElj80YT5D/oZ8Br9A6VZx0cOwNa1pI5T6M
         BuiGz8gO56yxdHcyTb/PN1lv28WsRSrQ3FX2X8VXX0S9Kn792sbvjrN6vbSRWBvP4JPQ
         Hk+w==
X-Forwarded-Encrypted: i=1; AJvYcCWWhTGz6HIaI469uDiwZuTUV5UT0RVYAq4KiVJhq2TVFxT01wvm/BNIjjMkENbEP+c9wJ/8zBcpG4I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP1M9vXqimI48hp9x3vawHmAyqYGJAQrtxX27/h9jMmMyFd79B
	D6Gw8mZ9ONvgrS28x7gp0ZrbSyVdavzaHmOqQuzMtZAHVWYPEsFV
X-Gm-Gg: ASbGncsjIp8thyWk/ruxwPTc2amugE1pDP1L8XiRJa0DNsF98PL/FtpMXyvwSLqrb4j
	VRtXnAnviNIkP/6MBhJDFsAAhNKWVyJ7IVaYKVw1NlZlHugXIjC7udOgnDpF/e+XOsUOSZzx93q
	NnktQJ0rDV5ubAd5+bZJBbruI8+vu5kyTUthctfKZhHXOvSNi2DJYf1efBMnpDSpgtv27C9cLW8
	ut7daOsnoT/DbZqIdHbgQx+rNMojqlVLG1+xg443nDF5gOQzlpxRlQyBVfc4fnFtk/nX5rwOmzI
	DOmQumb3TuWcedH9Tg9CfbvkOajvtrRj/H87sESTdgwrDS0mdHzqd0bRw3q8FyMm66AQuJ1NQep
	bwGY=
X-Google-Smtp-Source: AGHT+IEYqWSvO9nmRhuvu9Nod5I62ZHK0q1nd8Adc2Nrxqu798p8njg5jLN2TKIb2S4uFWzFr2oiJA==
X-Received: by 2002:a05:6a20:d503:b0:1f5:902e:1e97 with SMTP id adf61e73a8af0-2017998c2d3mr6583017637.41.1744389275369;
        Fri, 11 Apr 2025 09:34:35 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b06161333a8sm258713a12.7.2025.04.11.09.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:34:34 -0700 (PDT)
Date: Sat, 12 Apr 2025 00:34:24 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
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
Subject: Re: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant
 parity code
Message-ID: <Z/lEkDwefWvw4ZA3@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
 <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
 <Z_a9YpE46Xf8581l@yury>
 <e97a83a2-dabd-4dc3-b69a-840ca17d70b5@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e97a83a2-dabd-4dc3-b69a-840ca17d70b5@zytor.com>

On Wed, Apr 09, 2025 at 07:09:28PM -0700, H. Peter Anvin wrote:
> On 4/9/25 11:33, Yury Norov wrote:
> > > > 
> > > I don't have a strong preference for the name, but if I had to guess
> > > the return value from the function prototype, I would intuitively
> > > expect an int to return "0 for even and 1 for odd," and a bool to
> > > return "true for even, false for odd." I recall Jiri and Jacob shared
> > > similar thoughts, which is why I felt adding _odd could provide better
> > > clarity.
> > 
> > I think they said they are convinced that parity should return 1 for
> > odd because of folding and __builtin_parity() arguments.
> > 
> 
> And for bool, 0 == false, and 1 == true. In fact, the *definitions* for
> false and true in C (but not C++) is:
> 
> <stdbool.h>:
> typedef _Bool bool;
> #define false	0
> #define true	1
> 
> If someone wants to make more clear, it would be better to put "typedef bool
> bit_t" in a common header, but that personally seems ridiculous to me.
>   >>>> type from u8 to u64 for broader applicability, and updates its return
> > > > > type from int to bool to make its usage and return semantics more
> > > > > intuitive-returning true for odd parity and false for even parity. It
> > > > > also adds __attribute_const__ to enable compiler optimizations.
> > > > 
> > > > That's correct and nice, but can you support it with a bloat-o-meter's
> > > > before/after and/or asm snippets? I also think it worth to be a separate
> > > > patch, preferably the last patch in the series.
> > > > 
> > > I quickly tested it with the x86 defconfig, and it appears that the
> > > generated code doesn't change. I forgot who requested the addition
> > > during the review process, but I initially thought it would either
> > > improve the generated code or leave it unchanged without significantly
> > > increasing the source code size.
> > 
> > That's what I actually expected, but was shy to guess openly. :). It's
> > hard to imagine how compiler may improve code generation in this case...
> > 
> > This attribute is used when there's an asm block, or some non-trivial
> > function call. In this case, the function is self-consistent and makes
> > no calls. And you see, const annotation raises more questions than
> > solves problems. Let's drop it.
> 
> Ah yes; one of the quirks about gcc asm is that an asm is implicitly assumed
> "const" (with no memory operands) or "pure" (with memory operands) unless
> declared volatile or given an explicit "memory" clobber.
> 
> So yes, the compiler can most definitely derive the constness from the form
> of the function even in the variable case.
> 
> I would still like to see __builtin_parity() being used as an architecture
> opt-in; it can, of course, also be unconditionally used in the constant
> case.
> 
> So in the end one of these two become my preferred implementation, and I
> really don't think it is very complicated:
> 
> #ifndef use_builtin_parity
> #define use_builtin_parity(x) __builtin_constant_p(x)
> #endif
> 
> static inline bool parity8(u8 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parity(val);
> 	val ^= val >> 4;
> 	return (0x6996 >> (val & 0xf)) & 1;
> }
> 
> static inline bool parity16(u16 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parity(val);
> 	return parity8(val ^ (val >> 8));
> }
> 
> static inline bool parity32(u32 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parity(val);
> 	return parity16(val ^ (val >> 16));
> }
> 
> static inline bool parity64(u64 val)
> {
> 	if (use_builtin_parity(val))
> 		return __builtin_parityll(val);
> 	return parity32(val ^ (val >> 32));
> }
> 
> This means that an architecture -- in particular, x86 -- can still ask to
> use __builtin_parity*() directly. It means that architectures on which
> __builtin_parity*() produces bad code should either complain to the
> gcc/clang team and have it fixed, or we can add additional mechanism for
> them to override the implementation at that time.
> 
> The alternative is to stop worrying about overengineering, and just do it
> once and for all:
> 
> #ifndef parity8
> static inline bool parity8(u8 val)
> {
> 	val ^= val >> 4;
> 	return (0x6996 >> (val & 0xf)) & 1;
> }
> #endif
> 
> #ifndef parity16
> static inline bool parity16(u16 val)
> {
> 	return parity8(val ^ (val >> 8));
> }
> #endif
> 
> #ifndef parity32
> static inline bool parity32(u32 val)
> {
> 	return parity16(val ^ (val >> 16));
> }
> #endif
> 
> #ifndef parity64
> static inline bool parity64(u64 val)
> {
> 	return parity32(val ^ (val >> 32));
> }
> #endif
> 
> In either case, instead of packing the cascade into one function, make good
> use of it.
> 
> In the latter case, __builtin_constant_p() isn't necessary as it puts the
> onus on the architecture to separate out const and non-const cases, if it
> matters -- which it doesn't if the architecture simply wants to use
> __builtin_parity:
> 
> #define parity8(x)  ((bool) __builtin_parity((u8)(x)))
> #define parity16(x) ((bool) __builtin_parity((u16)(x)))
> #define parity32(x) ((bool) __builtin_parity((u32)(x)))
> #define parity64(x) ((bool) __builtin_parityll((u64)(x)))
> 
> As stated before, I don't really see that the parity function itself would
> be very suitable for a generic helper, but if it were to, then using the
> "standard" macro construct for it would seem to be the better option.
> 
> (And I would be very much in favor of not open-coding the helper everywhere
> but to macroize it; effectively creating a C++ template equivalent. It is
> out of scope for this project, though.)
> 
IIUC, you prefer using the parity8/16/32/64() interface with
__builtin_parity(), regardless of whether there are users on the hot
path?

If the maintainer has no concerns about maintenance burden, I also lean
toward this interface. While I don't think the implementation is
particularly complex, I'm not the maintainer, so I'd rather not argue
about the maintenance aspect. Also, to be clear, I don't think I'm the
right person to provide evidence that performance or code generation
matters to any user.

OTOH, If we do end up going with one of the two approaches, since
bitops.h is included (directly or indirectly) by many files while
parity is only used in fewer than 20, perhaps we should move the
parity-related code to a separate parity.h. It doesn't necessarily have
to be maintained by Yury - it could be someone else, or me.

Regards,
Kuan-Wei
