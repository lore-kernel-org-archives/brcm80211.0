Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D8A24888F
	for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404081; cv=none; b=Ejf59E/cJKWXSP6+n0ifAR9SpS3rYwjQeeLL6t3T6v02c4SalcnY5fXirOfPXjlRqh86V1aCMa3kymvh9M6h9wNJpzlBbnZnP6JY5CPVAMBP5Bn6cyFH99kHI8olabMcPiCOpzLGlgWsO9eJbNDUdjs4qxvbHfnp1nsl/C8k6vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404081; c=relaxed/simple;
	bh=qKTv7i9UlJGQGohAN6G2hXNKurAdQm5fSABB4QmmjxI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1XA5g977M26MJfqLYO0v9zjoedLAf0IYXIu0lJl8s0xTNBshg+2x2hb/hjHNOhTS6EPl/P1crXDP6/d/CWPX4gNLKSVgtflhYTIvT1zZWbNUBWKq+m8sUaMsblBLyMlD95Qy98fP9uqSHwP/RMJoyeZwEn1Zzj5/0A9oLKbTTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jjb7/iVw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jjb7/iVw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-439950a45daso26823295e9.2
        for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 05:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740404076; x=1741008876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAg+3nWpCX28gp0yop3cTi7eprtgpHgYieQoEXp/Zxw=;
        b=Jjb7/iVwIoBOicmBevFPLT8h5XFFqP2Gdy0IQZ30HHaT5gSCy7Y0FHGcWc/3TCIo1n
         1FO3M50p72wVtQgTQsKXaZ6MiEVYPBiiBbOhMe9+1zyMRL+9sYJFY+Sn87q4ZvD+4UMZ
         cWwvWgJIkdWP5NcFQGNDR26lUbbPRWmw8Y5pWRMUtv03ZLLsJcrHdsxva5eBi9htzru5
         IdqBQI4JUlgDHJUSRdnt0aZdupIhK7tquLmsydOu5uWrg5gH3jaV7XAl3acP80gurJRH
         HM+Q6oWx6fBDVZisl/H8zZBXBISRnCqTzafLKxmRu7fYCDTJAHFWm8XpuFYBOj3hNGDw
         fKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740404076; x=1741008876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAg+3nWpCX28gp0yop3cTi7eprtgpHgYieQoEXp/Zxw=;
        b=MvB5nezJNUUEQMePhM87A5BsrLjOqx6zf2yzK01gR6+zvbtSZZmjyIPzAjpI2mwNM9
         YMuumLk8WQvf24tQHp9JWtDqG8/ZEWsIgdrj7u7o0aySu6Vhe/Qeha/ZfcZacxVPvd2f
         5NWA/BAMaZ32MPL1wPUgT2Zi5Ur9xueDlHyDPnJPPWEBoRf0BVRuXO8DEULj2Ir8g5RI
         iM1vl0GsDXGq4jhuWNyElHUVU1HcD89S5CeaARB7z2LJdXuQKyFzdvIMzHJ4660DNtO1
         bplRkOkNkN1Uft/HXPxzdf7WzSoCPMH52bU5Px3fjfszU4AjGw0RIkm5UED/Xvx9DAHr
         TOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUASHQHcsBPqxDeDUAlF1pI2ljGOgnRTu8Cw3AP//9jbso41ZXXyCKtyC1ET8xEyigsez5U0x7LhA8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy97NWf8NXXCMHKx/fZqWAjkt70KDNj68YGxQK0CKngUBrlKxaW
	DT6RndqZmALPiVpJGhFgiqF8YN36fOJLjMHfCS9W4clZWWBl7mz1
X-Gm-Gg: ASbGnctL8NKaK4xgTPU1BkSH95XLUgIzk6Ds3EgywW2oAHvr5mD0I3dzSBh3kog7BKl
	HxW3+mHMsiMofHbmPiM53nfXapQJOZhf291nAX0cBld2oK4kqxzj/SvO/sFH2r39U+G2bGaCd8u
	JTUIdn6WRlltlMx67yrO0GGISLPJAGSLNcNK0caY73YwIvRBrMUYjoZYPAWcufrgkBwcC06U2r6
	1x/D1mdBWYq0QJxVaIQ7KmCbpiqRvgVngVgH0hyRPdlq5znbfuR//gPPyPOwVuBXZtW3InArD7B
	ZIyBKWQAP4Dj35pJA64vAxRLjc9vwjlHPOZvNAeOFeutCzabyjBRY0smFi/hBe1S
X-Google-Smtp-Source: AGHT+IHAk3Wvwyk1vqkRenvO3RPC8nmIGBVFBN9gj/vKmwdIoVhq2/WUUPGNh8lDJR1/QVDS5j7zIQ==
X-Received: by 2002:a05:6000:144a:b0:38f:4d40:358 with SMTP id ffacd0b85a97d-38f6e7587c5mr11099286f8f.9.1740404075459;
        Mon, 24 Feb 2025 05:34:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f74817cbdsm9492882f8f.68.2025.02.24.05.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:34:35 -0800 (PST)
Date: Mon, 24 Feb 2025 13:34:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <20250224133431.2c38213f@pumpkin>
In-Reply-To: <bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
	<20250223164217.2139331-3-visitorckw@gmail.com>
	<bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Feb 2025 08:09:43 +0100
Jiri Slaby <jirislaby@kernel.org> wrote:

> On 23. 02. 25, 17:42, Kuan-Wei Chiu wrote:
> > Several parts of the kernel open-code parity calculations using
> > different methods. Add a generic parity64() helper implemented with the
> > same efficient approach as parity8().
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >   include/linux/bitops.h | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> > 
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index fb13dedad7aa..67677057f5e2 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
> >   	return (0x6996 >> (val & 0xf)) & 1;
> >   }
> >   
> > +/**
> > + * parity64 - get the parity of an u64 value
> > + * @value: the value to be examined
> > + *
> > + * Determine the parity of the u64 argument.
> > + *
> > + * Returns:
> > + * 0 for even parity, 1 for odd parity
> > + */
> > +static inline int parity64(u64 val)
> > +{
> > +	/*
> > +	 * One explanation of this algorithm:
> > +	 * https://funloop.org/codex/problem/parity/README.html
> > +	 */
> > +	val ^= val >> 32;  
> 
> Do we need all these implementations? Can't we simply use parity64() for 
> any 8, 16 and 32-bit values too? I.e. have one parity().

I'm not sure you can guarantee that the compiler will optimise away
the unnecessary operations.

But:
static inline int parity64(u64 val)
{
	return parity32(val ^ (val >> 32))
}

should be ok.
It will also work on x86-32 where parity32() can just check the parity flag.
Although you are unlikely to manage to use the the PF the xor sets.

	David

> 
> > +	val ^= val >> 16;
> > +	val ^= val >> 8;
> > +	val ^= val >> 4;
> > +	return (0x6996 >> (val & 0xf)) & 1;
> > +}
> > +
> >   /**
> >    * __ffs64 - find first set bit in a 64 bit word
> >    * @word: The 64 bit word  
> 
> 

