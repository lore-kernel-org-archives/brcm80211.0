Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A832135C9
	for <brcm80211@lists.linux.dev>; Mon,  3 Mar 2025 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741016612; cv=none; b=FOJaXZnQYst88RmnMOqwYG2uU3k+RLopdpZ0oIBvhFMXDle7PIqf+v82amE8AFiVds+VuZQNQqdYu+CXCMNXmqgewIHzwq7IHTOGYZoybJxuEs25+e+Vr2jZF5B87S2KG2SMtiZu914a+EQWTXXrtVvWc1GmHlaSrO8NIQxwy8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741016612; c=relaxed/simple;
	bh=e7sJsPxftEmqUF7aflD0iSt9xRNb7hVvNLp83A2uWUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExVFCEk3QObOG23CBGVE9CQ+dIXpODx875OUJ69brDh88WtbHsDemGJT3JscIT4YgPGcT7i33IzCNzVeG2LXl38mXx48IHgkpBkS4ZmE2bS5EqIlAUOVGyyFnCX+pw3J6e30mguxNf5xAWaXekArCQ4YKcb3HDHlSBQXcP60ihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnyMXRPI; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnyMXRPI"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e573136107bso3977618276.3
        for <brcm80211@lists.linux.dev>; Mon, 03 Mar 2025 07:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741016610; x=1741621410; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bze7IhHFHWNKOAl2fnuzVpo5poDDbwUFQZHYPw6zzY=;
        b=EnyMXRPIAtDwKI+uSvczztoUAOmDI0B2WA+iNVxKkHwZ9hc6nV9rIgi3HFlyBHXSNV
         qouPtAgopKjYqGXSEzBQl2gNOojTgL86KXxEOLftU4F1WTSpywyyM6y1uEBv6r1kpsrM
         EdoXhUt2Jz/AMNGcbS81vLVE9xpMdkYqG/9az/jaJSxWaB3DEu3giY1DjpeObDzP42e0
         oW+8I6/RtZmvG/h6N4oCLbSZ2t7oTwlGtgwtDZ+AgxGgsWcDI00GLOoe5pC+62Yp9/B4
         yFvsgROuX1r+8Bu5j+AC2ksWbIJjtDgZEAbx5RZQcc5ixkGov4d7bSlYZzCxe020YEOa
         hTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741016610; x=1741621410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1bze7IhHFHWNKOAl2fnuzVpo5poDDbwUFQZHYPw6zzY=;
        b=pS1DWR9E+ETzQ1YV6WDd/nG4ADO31WjwrqcReTS4U/QXdIRWS6BfWmu6Qu2JkjPBCE
         GVyedgNFh6fE/dok6La6RmVbXBZbBIYA/tByleIpbMC7jf1noANVh4fkRkdjSlgDn8Jq
         oZfe1MoNu3iDmLJzUKda0gKwnCn4CORq593tEpeCaVgBiE6NV/LJ0/jn9upv3sf5+VMk
         /U3gnZ2duRQJWZFzQd2r67ooBn4Swcoxxp2+CyTqLX7nTnQW69+GvFWZyjNX9VZvy6du
         /Tb+n2+kXkG4iai6LXAxjn7UtfWBokyD9X1X9kPwj1vIZuxzRR1LQzv0o1cgXfYpKsRM
         50CQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2qTGZbzZJVi8MX6celL/CCUPKrzryEZ1jD2Xgyaqzjb0sHmLV5Z324vLFeZ35mevdmx8ufaNTeq0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmrNSAdZJaywEz6ku+T2QORQEJM0QS1nTN2CP2vN1oJwpk/IJ2
	x59/D5JPwk7WIRA96sDFw7OkHvrnlPOtecosGdABbZ1+ExOKNfc4
X-Gm-Gg: ASbGnct3w/sJ8Eri5U/rszvjAc+b/q+qHbqZ2CDJX3SdJaXzGuqnicZwmy/W70etDi5
	AtU4tQ5BLc5cNfcPT9iBq0scLMDPMazdh/c/jnq18YMXgmruuZZjWo8DMDGf6kXp+dKVwwvjn/B
	NsrSXQAQ2pdV90oguT+UqLue+o14lEbaI7o5RA5jfDFvDghQ953z1h3VeyisaWDHWpizhpZ/Tvq
	HNdsemAVpPgXYet2b9O68l1eMSVSkSU24qNwQZScAT0AWokZcmzo5e1PO0tTgkLuZJI7AlyyJ9Q
	UAsCuoIkBBBi3O8DOGZT8kYQF+JKIlBdlFANXkLvW1ESwZqhAVo0qdaJTxF9Ph6sCuowV7AQdxi
	7xZJ7
X-Google-Smtp-Source: AGHT+IG89LZIvDJlj/3HacLk9/vOGUR8YR6jlY63nvw+Gy77ela/IFHbq/QbvXbn9Hpv7+y9TBQguw==
X-Received: by 2002:a05:6902:2748:b0:e5d:dda6:d25 with SMTP id 3f1490d57ef6-e60b2f5f1d5mr16067385276.45.1741016609877;
        Mon, 03 Mar 2025 07:43:29 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e60a3a20448sm3017480276.3.2025.03.03.07.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:43:29 -0800 (PST)
Date: Mon, 3 Mar 2025 10:43:28 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
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
Message-ID: <Z8XOF2DMMRKqam6R@thinkpad>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
 <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>

On Mon, Mar 03, 2025 at 10:47:20AM +0800, Kuan-Wei Chiu wrote:
> > > #define parity(val)					\
> > > ({							\
> > > 	__auto_type __v = (val);			\
> > > 	bool __ret;					\
> > > 	switch (BITS_PER_TYPE(val)) {			\
> > > 	case 64:					\
> > > 		__v ^= __v >> 16 >> 16;			\
> > > 		fallthrough;				\
> > > 	case 32:					\
> > > 		__v ^= __v >> 16;			\
> > > 		fallthrough;				\
> > > 	case 16:					\
> > > 		__v ^= __v >> 8;			\
> > > 		fallthrough;				\
> > > 	case 8:						\
> > > 		__v ^= __v >> 4;			\
> > > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > 		break;					\
> > > 	default:					\
> > > 		BUILD_BUG();				\
> > > 	}						\
> > > 	__ret;						\
> > > })
> > 
> > I'm seeing double-register shifts for 64bit values on 32bit systems.
> > And gcc is doing 64bit double-register maths all the way down.
> > 
> > That is fixed by changing the top of the define to
> > #define parity(val)					\
> > ({							\
> > 	unsigned int __v = (val);			\
> > 	bool __ret;					\
> > 	switch (BITS_PER_TYPE(val)) {			\
> > 	case 64:					\
> > 		__v ^= val >> 16 >> 16;			\
> > 		fallthrough;				\
> > 
> > But it's need changing to only expand 'val' once.
> > Perhaps:
> > 	auto_type _val = (val);
> > 	u32 __ret = val;
> > and (mostly) s/__v/__ret/g
> >
> I'm happy to make this change, though I'm a bit confused about how much
> we care about the code generated by gcc. So this is the macro expected
> in v3:

We do care about code generated by any compiler. But we don't spread
hacks here and there just to make GCC happy. This is entirely broken
strategy. Things should work the other way: compiler people should
collect real-life examples and learn from them.

I'm not happy even with this 'v >> 16 >> 16' hack, I just think that
disabling Wshift-count-overflow is the worse option. Hacking the macro
to optimize parity64() on 32-bit arch case doesn't worth it entirely.

In your patchset, you have only 3 drivers using parity64(). For each
of them, please in the commit message refer that calling generic
parity() with 64-bit argument may lead to sub-optimal code generation
with a certain compiler against 32-bit arches. If you'll get a
feedback that it's a real problem for somebody, we'll think about
mitigating it. 
 
> #define parity(val)					\
> ({							\
> 	__auto_type __v = (val);			\
> 	u32 __ret = val;				\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
>                 __ret ^= __v >> 16 >> 16;		\
> 		fallthrough;				\
> 	case 32:					\
> 		__ret ^= __ret >> 16;			\
> 		fallthrough;				\
> 	case 16:					\
> 		__ret ^= __ret >> 8;			\
> 		fallthrough;				\
> 	case 8:						\
> 		__ret ^= __ret >> 4;			\
> 		__ret = (0x6996 >> (__ret & 0xf)) & 1;	\
> 		break;					\
> 	default:					\
> 		BUILD_BUG();				\
> 	}						\
> 	__ret;						\
> })
