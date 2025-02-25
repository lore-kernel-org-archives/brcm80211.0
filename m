Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FFD42A97
	for <brcm80211@lists.linux.dev>; Tue, 25 Feb 2025 22:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740523589; cv=none; b=VfY4ahu+MDFKr4Ld6mhfboSdTjTHxIZ+oImSl5fh3F/kPqi6sz3TfEpfsjgLswx6pZ4pSQAdvyjr4/eWuJnKBSQyk5LztBE1kTSorlsMZJFePjbCoqxWdWA1W7dpnfaL/hyHPLL/3cyYI26eNdftL7ZYXCmmzHkITrqp+JSxvJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740523589; c=relaxed/simple;
	bh=hDdsaKuLGPPO2QMEwawtpGkH8Byraw3yse7aBvdGdaw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjnqrcmVOByK9mAtJZFKSxXPyL1DrhuqyzT709/JyaqfDID9bCSsI3BNxxwEaGRf6pYyGxDsjKhDEAzUvqnfPtJENrjteKOfgaNpjCsCHObKU6HDnn0Sr2TTd1vY02HQ1AUWBeQKn1B5sVQr5qMOq7Kew0eme1kJvsVudw00Twg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ins4Hkdx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ins4Hkdx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so1568055e9.1
        for <brcm80211@lists.linux.dev>; Tue, 25 Feb 2025 14:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740523586; x=1741128386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xEzm5a7MvJg/wvZ+Z8+F/9tGDPPJZX+eI/HEgAntBA=;
        b=Ins4Hkdxq0Vbd7/eSua15b7rVBNkLXUjOXtxVFWSMua+QnTDDPUnuO7fka8ou/RqjL
         Dqrk0yAo/KLLCuvi79ubGVoAZbVxZvw3yX3fFqNQJJRtxar1wWZZ5Y1zR4EJ5IzVG10U
         8SWQ9e4aAQ0S2TkC/8ey0pEEXP+YmXFuWtsO0Z9rBZ8rscEk9pmX09jRxAa0puUL17Lw
         avmju88vYxi68v8sj3jjBHh60FcfXvna4aID4APAw7Nr9fmXyRMwZ3K9XpT/06XrVxvz
         HEQLbbqSkVzTHB0jql+0Gbj7g6/mGZeaUpnb9Mu3j8eWVKbBdT8GtRb1mTBxVUWRYkKo
         2paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740523586; x=1741128386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xEzm5a7MvJg/wvZ+Z8+F/9tGDPPJZX+eI/HEgAntBA=;
        b=hbHrdWy+QMLZiWteaOf/vzOMgaupLhov4KlBLvVGY7Tr7aw8lg6hnpAidX8F0RFwRA
         ZKRrS1O8ZGOi99auSz+yo1ETPnVEIEv2FHDg3Srrobwd9U60sqiFNN7fREEEB9c5Dlsq
         ueDohUkeIMf4SPTEX29GfN8fOzi1K/I6+02W460/kEIdaCV7pz76oorH/h6IHiMoz1qd
         SvM1IoM8FUR1VTqxcG4JRITo7th492D7HyiVoxEttJZTL9UdGRGZXKANS6EVd62dztkM
         AhsbG8o8th6P8p+w9MRHyJvxf6im/2BCUQ9zi8i2FYY+b+YHSB4xISAvXQK6TMRutSgv
         fuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl8kqIGeVgNJ4nmgAX/Gj49tRIOPGlwlCRx9ElRf0Qslmq/YYuf1kXPv+lEYbDK+nljTX2fBWk9QU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxVcy90BmE7Ux+aWpD+iy7ytpaScezgdpAK+uRLHV8bzO7dU1lJ
	6c4V7CjBPj1/8sJ9huFhgc3zuKWBBRMhxQdcgI/j8N0nbJXvLwwu
X-Gm-Gg: ASbGncuAHHLx33PnQuh9N1aLFIdCbaZHxbEzsMYyxc71baCmItgkKQdFvnhiZohmmVD
	6N9q5HqqoPqU/WhhCWfZIYvsYF3Dt0kBhif9852HgH16ZTE4nxpFB89SSUZ5L6Rt/6ZBRGY77PS
	e9Qx7GeC/bgJ1Aya+PJ4PERBYMSAnuTW4jeTo2I/LyY/G/a3L7jSV5h+/plH1t4pdGgQNHJWFcc
	UWqms02kGF0gENMw0pnmBnCeWdUDrEIGNgZhd6GrVBceft+H0N69GnB8+yVQS14c8HH9lBhO2d8
	8x81Ih9zaSoJB+bYtjNRrLVUyT052/OrpTg9rjCUy24hQlPjp+b6DepcSPW6D7Ej
X-Google-Smtp-Source: AGHT+IFjrInluoqnbFjbjbGFkCsa4TCd0YMAhHctzgy+ODQ6ToD9u7urtlYhpUHFZQok7JnATsU7Wg==
X-Received: by 2002:a05:6000:144d:b0:38f:4f17:ee29 with SMTP id ffacd0b85a97d-38f6f3dca7amr14183257f8f.17.1740523586194;
        Tue, 25 Feb 2025 14:46:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd88295dsm3621054f8f.45.2025.02.25.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 14:46:25 -0800 (PST)
Date: Tue, 25 Feb 2025 22:46:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 mingo@kernel.org, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with
 parity8()
Message-ID: <20250225224623.6edaaaa9@pumpkin>
In-Reply-To: <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
	<20250223164217.2139331-4-visitorckw@gmail.com>
	<d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
	<e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Feb 2025 13:55:28 -0800
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On 2/24/25 07:24, Uros Bizjak wrote:
> > 
> > 
> > On 23. 02. 25 17:42, Kuan-Wei Chiu wrote:  
> >> Refactor parity calculations to use the standard parity8() helper. This
> >> change eliminates redundant implementations and improves code
> >> efficiency.  
...
> Of course, on x86, parity8() and parity16() can be implemented very simply:
> 
> (Also, the parity functions really ought to return bool, and be flagged 
> __attribute_const__.)
> 
> static inline __attribute_const__ bool _arch_parity8(u8 val)
> {
> 	bool parity;
> 	asm("and %0,%0" : "=@ccnp" (parity) : "q" (val));
> 	return parity;
> }
> 
> static inline __attribute_const__ bool _arch_parity16(u16 val)
> {
> 	bool parity;
> 	asm("xor %h0,%b0" : "=@ccnp" (parity), "+Q" (val));
> 	return parity;
> }

The same (with fixes) can be done for parity64() on 32bit.

> 
> In the generic algorithm, you probably should implement parity16() in 
> terms of parity8(), parity32() in terms of parity16() and so on:
> 
> static inline __attribute_const__ bool parity16(u16 val)
> {
> #ifdef ARCH_HAS_PARITY16
> 	if (!__builtin_const_p(val))
> 		return _arch_parity16(val);
> #endif
> 	return parity8(val ^ (val >> 8));
> }
> 
> This picks up the architectural versions when available.

Not the best way to do that.
Make the name in the #ifdef the same as the function and define
a default one if the architecture doesn't define one.
So:

static inline parity16(u16 val)
{
	return __builtin_const_p(val) ? _parity_const(val) : _parity16(val);
}

#ifndef _parity16
static inline _parity16(u15 val)
{
	return _parity8(val ^ (val >> 8));
}
#endif

You only need one _parity_const().

> 
> Furthermore, if a popcnt instruction is known to exist, then the parity 
> is simply popcnt(x) & 1.

Beware that some popcnt instructions are slow.

	David

> 
> 	-hpa
> 
> 

