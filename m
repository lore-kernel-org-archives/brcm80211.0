Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3DD1D54EE
	for <brcm80211@lists.linux.dev>; Sat, 26 Apr 2025 09:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745658883; cv=none; b=b5fgm7AkpbyZ8hY32DKxRqXco+UlO8nVXQDstdSZf2FxQyN65C4qZrOsbWqC9hP6vP+zR4rgTajvCFzfIrJPQSe2Rpzp2bwxvcEHsvksCX2HkLbdSSEdmgsP83+kybyzp2PBNpQFzQmNNgDGfGofPPh8MOg/lJ4KC3Fvp+JRZPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745658883; c=relaxed/simple;
	bh=ajA2/KThvOLmdGQMQlMZ8JSc3s7TdqFCTO4mxSXZP2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWfBx05yVWw5DGWEceUyIj9Qe29A1yxv6ETxf+Z7Uc1qFsceOCmAoJDxEx0gM8CDt0P6HSY0izNe6/+xe5DE1jo88XmbRJNuhNAZjM8FU0vnlPDWLm31+TGbvtkpD68jO6FkyTlt5pjsw/9K0ygqu+O837fR94kJHoa5gaX2GFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8jHzfqW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8jHzfqW"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7376e311086so4234338b3a.3
        for <brcm80211@lists.linux.dev>; Sat, 26 Apr 2025 02:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745658881; x=1746263681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dpw6EJump0TSOrBYBam8lLy7cnOl6Tzi7s2IdyQv1Eo=;
        b=S8jHzfqWPG0qfVMjj7rQjtUGcgBek3Ob8z4lbK5RUy3t8rd2ItZsZrQjvg15A2SWNz
         jrPabzVxOzdsIDR0lyyHnDZd3XbAaLlFiolOIGx0/8qNqLD+u6BF37sQ2a5XWe6UWwzP
         AEBUenT0JMFCLRyhBtRtPOi8Kx4bRX61aDBlEGf+jicNetQMafc82edWVNrpaBEIHBaY
         6TckQjdDfXPaxqT0k9jwmrJ1TYcha8w1l9udh0T+XdlsIN5YDQGWx44MrZcO5xEeG/Wv
         Djf2YY9mpA16vvFs0qkOIkwMwLs3ORty8JjLsA1hxekH2RhqGyJT9o/nWNtqaDFOn+N3
         W3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745658881; x=1746263681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dpw6EJump0TSOrBYBam8lLy7cnOl6Tzi7s2IdyQv1Eo=;
        b=DM3zkGx7ufdXYPTUMLDW8aGp1HCdtdN3Y9T9NOEvOSljcAwWlWt5YWlUqNTVxHI2rl
         5Wl5PcyJ68a3j2M1fuklRdt77MEfza4oWozPFMFM1MQIU3DdtaYzOCGQjhHGlS630Njs
         28Jndhbi5QNNQxn6gR7uLNGHRw2xrY1SFhDOEQp4xP2d8nJomhjXHp+IxJKE8TMMHvmN
         9jHYsD64TGcfbUkGvD96bGDztS9vo+/RiDHSj+VtGO58h3w+FnoY51x/iMWUoBNGOFJn
         ASlYfBJEEPbf7Dqnqcp3KxHYd396rAGt8mk+Mo5WPruXaX7hy8rLLLBoDzOfKvIJi7SK
         pbmg==
X-Forwarded-Encrypted: i=1; AJvYcCXTmdA4VlEQyvr8B3DN9xY2skLI+dzb7ET57b9IyVvBtXH5Z2+QfzbD/fQS92iqeofjmCx3R5gHR8U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3De+8ItKQDPPQnBEUaDpVOZmKRH2nA4FZk1cByX3kCjlmWaeM
	Kh54jqJM4IaBxB7ze5UR9csgANmkQVGhbM6F2HK4ykO7ebQRmu75
X-Gm-Gg: ASbGncvZLiV8aZ+eV6aU45no4qzC55g0z0BQqffCTjWsyDvCSe6PgU4pulrOWJzTfQJ
	uBgK4jwH/y+eVHYK9IHZdAQK2B91UBqIysmQeI7M02fLhpyX3aDWWpXM+mV+S2u+K8tctehIUpR
	RgnzzvOpJmooTDXbkpZUYFs1mK0QXonkL62Hi0zVNuKdsk8voAetyfAsgY7lDtEUD4kZ+fWH82u
	QMxu+y2M8izVfCp58kmdx9vdFCreS9moZjkwDHCIIplhAyAV3NJgh2fuWGGwr8cFF5K9/7SZ5zC
	omXeaxpFJoZXZSVtvTbIEkLmDsWmoSy5i8l6SiWJsp+U1XfZji41slAkYP8npSoWJiPq
X-Google-Smtp-Source: AGHT+IFgnshRXYAm4vLgOrmgYGZWM8t1SObZHkSRdPxsGHvAJ5uKKQ60xC74a/vGxL92untQtleJTA==
X-Received: by 2002:a05:6a00:1306:b0:736:73ad:365b with SMTP id d2e1a72fcca58-73fd74c23c4mr7475320b3a.14.1745658881199;
        Sat, 26 Apr 2025 02:14:41 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259412b2sm4594535b3a.66.2025.04.26.02.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 02:14:40 -0700 (PDT)
Date: Sat, 26 Apr 2025 17:14:29 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Yury Norov <yury.norov@gmail.com>
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
Message-ID: <aAyj9SMvYrN9tXZC@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
 <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
 <Z_a9YpE46Xf8581l@yury>
 <e97a83a2-dabd-4dc3-b69a-840ca17d70b5@zytor.com>
 <Z/lEkDwefWvw4ZA3@visitorckw-System-Product-Name>
 <8571fd6f-4e71-4a6d-b2e8-16d9d72fa56e@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8571fd6f-4e71-4a6d-b2e8-16d9d72fa56e@zytor.com>

On Fri, Apr 25, 2025 at 12:33:21PM -0700, H. Peter Anvin wrote:
> On 4/11/25 09:34, Kuan-Wei Chiu wrote:
> > > 
> > > In either case, instead of packing the cascade into one function, make good
> > > use of it.
> > > 
> > > In the latter case, __builtin_constant_p() isn't necessary as it puts the
> > > onus on the architecture to separate out const and non-const cases, if it
> > > matters -- which it doesn't if the architecture simply wants to use
> > > __builtin_parity:
> > > 
> > > #define parity8(x)  ((bool) __builtin_parity((u8)(x)))
> > > #define parity16(x) ((bool) __builtin_parity((u16)(x)))
> > > #define parity32(x) ((bool) __builtin_parity((u32)(x)))
> > > #define parity64(x) ((bool) __builtin_parityll((u64)(x)))
> > > 
> > > As stated before, I don't really see that the parity function itself would
> > > be very suitable for a generic helper, but if it were to, then using the
> > > "standard" macro construct for it would seem to be the better option.
> > > 
> > > (And I would be very much in favor of not open-coding the helper everywhere
> > > but to macroize it; effectively creating a C++ template equivalent. It is
> > > out of scope for this project, though.)
> > > 
> > IIUC, you prefer using the parity8/16/32/64() interface with
> > __builtin_parity(), regardless of whether there are users on the hot
> > path?
> 
> As a per-architecture opt-in, yes.
> 
I'd prefer to see Yury agree first, otherwise there's a high risk of a
maintainer NAK after the next submission.

Regards,
Kuan-Wei
