Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8E1267716
	for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416205; cv=none; b=rRBxoDcerANqDQ47sTsgBzb9Os3j9iW9g/4DeiqH0xJB+l0O+hHfTwDp255/NhGJeaBFrkIuH7/ikSBxrEt7OJx3tTlC0xz4K5df/PIfkrdTjJ8eoQ7ln+cLDfqiunO4X6TT9NY+bCRsFQoNpd4FPUz/4G15N9VnabILtcoDMS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416205; c=relaxed/simple;
	bh=5G5oGYh1CaRHc2d1pU1YAOARWQsm2s7Z+o+/b8xWRQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qs7EuvIN8T5g3pnHbMCxZIRXKsUfMydJpMi73caTN2kolbpghBLYivur+VvuO/0Sq2LZ8jaCcZ7MMXlMnzzhAdKs9rkYrDZcglDvQnSd+G8y3GDI8sXhQPUy3/IFsxopd8kPXmudT4M15A6CQHdnY0O4l+VeNLKi9Vy50vTw9aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2BnlfZc; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2BnlfZc"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-219f8263ae0so97748235ad.0
        for <brcm80211@lists.linux.dev>; Mon, 24 Feb 2025 08:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740416202; x=1741021002; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uiOFRZn2H6lerxDkJoj1wxqiGhkAtJgTGIELTuQhums=;
        b=P2BnlfZcyygbYLS0z2hGa5ApUvv2f+OH4K/aj6kYfCcDcAA6fL3a0aDDX2s/P8AraQ
         hiUiUz1Ya60E+w3I76MXBcyFf/GvP6BMFD+8U0bHBDsOsBM9zK8/coxcF0VqbteJD7lb
         hMd3FssHsl23Sh/fVJRYiyy+bZNrMcrbIRUKhSn43Y0MaXFtQFuUYND4DnuczAic3nYe
         dS0S/Uz5uKbayEs1SIgVO0r4OceBnSG5yqBs5xmqc1b9kz27FjgaEeMt9hAzbfWFz9x5
         Zi4Qk2zow9U/LLcfL9VGKqvopKFWuyMuHycXTjQSI5586yh8Yz9IVp7Sr0EYd3sdYNSJ
         9JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416202; x=1741021002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiOFRZn2H6lerxDkJoj1wxqiGhkAtJgTGIELTuQhums=;
        b=eYK5YdJFjhpN2KnNqokFqpdqVJEaN1e/KpqBeX/JJAKrbyuiPl1TuxaLAin//57M2J
         fFmpuZrNPxdaxpbX7IgKX1PCmtA3jRWx+9VPvLtrACBl8ISrZBMzPO0k8uV4zLOT1eqy
         ANFwBSXd0m5pKtsq5a/y69cmdyWQG0oaPy9MZWP7+GKPD9/tuD+GGsAF5MhS5WyREnYd
         l6nSTlqoQyaOstyIF/h1k8sAsVfWJRFJp2M4Nhl5V/OnOW+HW/ckLzGQGlYtjfp9ZLPY
         StKS60Fj5NawSxetmAXo4PcTBYKebUwwTiQ2rT2Z2ne0lm435q4t8oTw5n7lABqdzqSd
         28lw==
X-Forwarded-Encrypted: i=1; AJvYcCUxhvLs7w7iY8i6M38Ntms9+5KhqhMKwlZfpC7EoXMIOmfertH6Ra3cMgXinrNgtxOzBswIaUVBA9c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhYYXkrBQKszFMQYFAp4RYsYlJShpgW1qYBcjKBA9VmQxBWRkL
	Ul+KRCoMSdIhVtblm+zpJeY5zVupkus3Ivq5UtV9wMT4RkqzjSHv
X-Gm-Gg: ASbGncvuyjE0kc88wiHGqqHqc6m1oChYQ5Afy72qq4hJvNeqfbDobuK76YxvZzfYfMZ
	14dBEpP5x57XkyYKRtS0ETTWoaF5WireyEiUPPP/OYI7I+gD1xSkG84CzMqzVh8QLsBgu6oqrq5
	4yVfSv2vWJPnad87qWnFcq24UBXhLY+xT5P5wKUkeIedT6fJdbUDq3XO2qB5+vVk6O6Yr6X5lRm
	3XgaI7eh++iVwnOX+saMrllufCmgd3siDWD9YtorDTceTSxrFUlOnW9mW5o/VY26yVjNpJfq0JX
	svt/S7T89xd2V57Ef08KjvNVNVKW
X-Google-Smtp-Source: AGHT+IFVgQBLmZYFNL+ZV4HrxXg4lZgXZnXGnGr0U7DF5esCoQcIST0NuWk3m7oQnTUJjc9HIW9Ozw==
X-Received: by 2002:a17:902:d492:b0:220:c63b:d93c with SMTP id d9443c01a7336-221a11b9493mr230835105ad.44.1740416201946;
        Mon, 24 Feb 2025 08:56:41 -0800 (PST)
Received: from eleanor-wkdl ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d534afadsm185140065ad.26.2025.02.24.08.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:56:41 -0800 (PST)
Date: Tue, 25 Feb 2025 00:56:29 +0800
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
	yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z7ykvf1g03XDLXKc@eleanor-wkdl>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org>
 <20250224133431.2c38213f@pumpkin>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224133431.2c38213f@pumpkin>

On Mon, Feb 24, 2025 at 01:34:31PM +0000, David Laight wrote:
> On Mon, 24 Feb 2025 08:09:43 +0100
> Jiri Slaby <jirislaby@kernel.org> wrote:
> 
> > On 23. 02. 25, 17:42, Kuan-Wei Chiu wrote:
> > > Several parts of the kernel open-code parity calculations using
> > > different methods. Add a generic parity64() helper implemented with the
> > > same efficient approach as parity8().
> > > 
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > >   include/linux/bitops.h | 22 ++++++++++++++++++++++
> > >   1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > > index fb13dedad7aa..67677057f5e2 100644
> > > --- a/include/linux/bitops.h
> > > +++ b/include/linux/bitops.h
> > > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
> > >   	return (0x6996 >> (val & 0xf)) & 1;
> > >   }
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
> > > +	 */
> > > +	val ^= val >> 32;  
> > 
> > Do we need all these implementations? Can't we simply use parity64() for 
> > any 8, 16 and 32-bit values too? I.e. have one parity().
> 
> I'm not sure you can guarantee that the compiler will optimise away
> the unnecessary operations.

Hi Jiri and David,

Unless we can be certain about the compiler's optimization behavior, we
prefer to follow an approach similar to hweight, distinguishing
implementations based on different bit sizes.

> 
> But:
> static inline int parity64(u64 val)
> {
> 	return parity32(val ^ (val >> 32))
> }
> 
> should be ok.

We will adopt this approach, as it is indeed more concise.

Thank you all for your feedback.

Best regards,

Yu-Chun Lin

> It will also work on x86-32 where parity32() can just check the parity flag.
> Although you are unlikely to manage to use the the PF the xor sets.
> 
> 	David
> 
> > 
> > > +	val ^= val >> 16;
> > > +	val ^= val >> 8;
> > > +	val ^= val >> 4;
> > > +	return (0x6996 >> (val & 0xf)) & 1;
> > > +}
> > > +
> > >   /**
> > >    * __ffs64 - find first set bit in a 64 bit word
> > >    * @word: The 64 bit word  
> > 
> > 
> 
