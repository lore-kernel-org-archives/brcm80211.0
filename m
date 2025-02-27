Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5531B0439
	for <brcm80211@lists.linux.dev>; Thu, 27 Feb 2025 18:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740679535; cv=none; b=NcJVzD/rEAkxhZCKqpBRlFJILbxB+ho9kj4ULVwTrskNDZ3mPgoCUoiEAp9N7iRtXw4aBbhtj47LsQrqDgYr6JtV37UJKk4ibRObdjuDiQ76RBHiIjxqz8M4DOHyxglCB8u9WZ4w+0NxzyjgccRQkSVKDJI6EVUWkOM9psXhGls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740679535; c=relaxed/simple;
	bh=OqW0tsQmgxjdGZPx5rAhLoVP8V4pb2gw1BYl3oruHT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Csujv7pBKIk+qs//ihUUNSjYRcTfdn2NNBwKrcV0Yy456zcT2Ng3CKqAYqJP+BqyWr8/FxBh5Qh8s+x/Gfs7bLIUS5nroAc/Yt2zetxyUCxoFmlelTOkw/rXSqB5KgeORVygcrskRgUF/iMQJLupx4E79fG5rgtOh++aaB3VYtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAwrL5z3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAwrL5z3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220d132f16dso18842475ad.0
        for <brcm80211@lists.linux.dev>; Thu, 27 Feb 2025 10:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740679533; x=1741284333; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WlMEi7Una8TwxGaYzKJCUvFP5cGs/B6xguOFMjaN1Ww=;
        b=lAwrL5z3UTOMUmmjtS+63WHbojgv4gSrsCLMHjqgAdUXSKOsLNqvk6aAaO80BOqLZh
         rgjXTPbiIUYXTRy3sCkl6LqhNuOoy3Aig4mNinfIb2F5RHq6pXuxDhycriYAOyFjxJxV
         cpj3ps8JdmtuU/4kgAVKkD9zmUFEBWH0aR3ZteDWXnHkBOYxjxxDYB/0zE/xn+wndwSn
         3p+MMvx3U4mtCVOr6iQ4DKfrRxictNLHjC+zHwvG7XErAXDqJ8DNH+8xMht2o6Rrebl1
         tsVRKqQFul/NyPpt99jEpBikuDxPGgpXdpFo2VfrSHOgiT7GFGrfz2M6a/hyKFFVtkOB
         O1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740679533; x=1741284333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlMEi7Una8TwxGaYzKJCUvFP5cGs/B6xguOFMjaN1Ww=;
        b=DtCLffGMTcL677t259/iT/dKA4i4iqcCxIhqOeY0tYiIc8ZDGhSslJL1BvDTf4x8BW
         nV8DXhDza+MqU+KtIA80B+yJAQggCnuahPdMs42zOxejt+jlpltlBSgyS1U1ugagMn0S
         QEZ2TQQ/tGb8RCgycX6c6dTsHBYI0pshY3GFmw6FAOwYC1yVzzvUjokXfNLyTh2ciRdY
         aoHAh33tiuzWZXEfxpFdipSkAbQICFH8aWeuq6x5iwITfgmdMCDSEFUC4Tw0T7V4mfGr
         adYtQhVM6q64g1XqPgZdOAEsAkzNPFAReE9GUuyza98e/PwsCh9CqZngc8u0Ggmb6kDR
         Ucgw==
X-Forwarded-Encrypted: i=1; AJvYcCVsEci3wcbBNbIuQumkRH4i98nNjmOkBpPZwYuL1ECNGbKWY8Pma24IVqs/s0m/l1BoCw9WvCeMW9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRJaRaoAWd6+xf+3KHjeF36A19J/7Gz3ks9ru0rY+itfTzCHKn
	DVM7uEoNGwN6fLDU0KCXogangLvZcMhImiKoI1QUz6ONQUjeybR3
X-Gm-Gg: ASbGnctAjNaoUCR1kYLlWjKtjrw25sFQnOjEv/UhKyCATJZGKjHSVBkvpYENEdS/myN
	tUS57+EzakZzCZAhYEZbYgLOaKP3HzOEVW3zHxqP1G2g0pTbEb08xcQhcynbUo9gbnnGfB3WUrn
	p15YQQn30aM0fMlemmoMEbR8j5z4q/3RlFjOkLP1mGFzYFxFzhxn41rQUgnVqOeJzvEAJal+bGX
	rFQb2QSiishGKAan6p4BsZ7z0OOltJq4jGM6UZpwIYz+AF6OOT3Y9z2CaFq6ZMxHJKC9i8FeXrX
	DtafJduJhspEsxRh6PTvVs1ijPzBA1l+rRZ0Db0CDAEsQuPehw==
X-Google-Smtp-Source: AGHT+IEnEhzc2owT1KH+D6qO8Y01zbjbSELOHxZjQy0YabJgdb+peb2Mulxfa+PI8nU5R7zu0Cxkog==
X-Received: by 2002:a05:6a00:806:b0:732:2170:b6a3 with SMTP id d2e1a72fcca58-734ac44b986mr473864b3a.21.1740679532704;
        Thu, 27 Feb 2025 10:05:32 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00600e1sm2015088b3a.171.2025.02.27.10.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 10:05:32 -0800 (PST)
Date: Thu, 27 Feb 2025 13:05:29 -0500
From: Yury Norov <yury.norov@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
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
Message-ID: <Z8CpaaHv0ahHFVuK@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <20250226222911.22cb0c18@pumpkin>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226222911.22cb0c18@pumpkin>

On Wed, Feb 26, 2025 at 10:29:11PM +0000, David Laight wrote:
> On Mon, 24 Feb 2025 14:27:03 -0500
> Yury Norov <yury.norov@gmail.com> wrote:
> ....
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
> 
> You really don't want to do that!
> gcc makes a right hash of it for x86 (32bit).
> See https://www.godbolt.org/z/jG8dv3cvs

GCC fails to even understand this. Of course, the __v should be an
__auto_type. But that way GCC fails to understand that case 64 is
a dead code for all smaller type and throws a false-positive 
Wshift-count-overflow. This is a known issue, unfixed for 25 years!

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=4210
 
> You do better using a __v32 after the 64bit xor.

It should be an __auto_type. I already mentioned. So because of that,
we can either do something like this:

  #define parity(val)					\
  ({							\
  #ifdef CLANG                                          \
  	__auto_type __v = (val);			\
  #else /* GCC; because of this and that */             \
  	u64 __v = (val);			        \
  #endif                                                \
  	int __ret;					\

Or simply disable Wshift-count-overflow for GCC.

> Even the 64bit version is probably sub-optimal (both gcc and clang).
> The whole lot ends up being a bit single register dependency chain.
> You want to do:

No, I don't. I want to have a sane compiler that does it for me.

> 	mov %eax, %edx
> 	shrl $n, %eax
> 	xor %edx, %eax
> so that the 'mov' and 'shrl' can happen in the same clock
> (without relying on the register-register move being optimised out).
> 
> I dropped in the arm64 for an example of where the magic shift of 6996
> just adds an extra instruction.

It's still unclear to me that this parity thing is used in hot paths.
If that holds, it's unclear that your hand-made version is better than
what's generated by GCC.

Do you have any perf test?

Thanks,
Yury
