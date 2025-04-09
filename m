Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B131D27701D
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 18:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222544; cv=none; b=e/fghtXYz3lS/kDvK81c43gKTpPERemP4qugfqEd2TyoitGuk9YOs1IlAjoK1oBzP3HsPu+Wx0LijE7+X/inA9uHj4XZ0PMIFIgqrbBTd5KqXkPsIvKuoUUzSMTucbtLk/Ps1nHggc35L+06MkuaoZUTbNiWdphkwpFv0Iuqbg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222544; c=relaxed/simple;
	bh=pTz8SR4y0nQIQ5L+V5YgaAfc7gRHs7i1nUyqBg3Fr+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cckh4+d0z6eFBKSCcSpC3+98SIumoP7dmjjJs1z88qVPR4mRm23ko/cR8JumVp92scKd9pAvB5qJSi+qFhdV9vRfMf5lgUjsk1xAEr05SXRHG5LSUI3paS6rWT/J57OaNwkk9UabK+t9xdFdogBns+0zIls7vfbbfNpzbBFFT+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RX8gWEOc; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RX8gWEOc"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736a7e126c7so6641187b3a.3
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744222542; x=1744827342; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RLlYeHtvUctAB5rHW2z6orExJGooSjFURuTNigxPPWQ=;
        b=RX8gWEOcs8ghZ2+ciMQsy5fLOSq5QGIWHleci/B0sTmfXTtUJ8gpM3kbD7iKhg43D7
         mvUjueVBshXErpl7b2rMqKS3teAjhChu6O+2CIDXLs8ExSXihbGaoCeylFgU9jkaP5nF
         0BxQUQbf4kgayLTutILdBoiYkyrcqyT//LOqrgfR//PsLSMVlNAu7h34S/eBgOrTYqSh
         bdK5EnkeCpI189T3IsA3L+NPDa/eopVp8eeileZZI7OGI9h0nbvDZIu4Hi6+8cCApzcs
         fmlrV1E9fPNxTfpqNmZAjhYvfZn69cPDvX+/k4LOEyeRohEB5+boppCkX+XSbYbHevW0
         EABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222542; x=1744827342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLlYeHtvUctAB5rHW2z6orExJGooSjFURuTNigxPPWQ=;
        b=bs8nTeO+JF8V/tWb+avwS7X2cabQm6EfV4nn1QYQikpyPUD+8qPOJbpw81HfjlJ9JT
         1OcZOQv3oBygJbUZ+xao1x+iJq6Yho3p9Sv44JzvBJKk90LXyxE4MmGjinsDEhoZtREd
         dOAA81dZUt9ahsADp9lVErDXto1SHxpqXeHPofMa9Hd0UVOmNpGiFRPCojaWCg41ora0
         3CEk7Zh5dyXpQNOlRCygsdRURqeAETkiKrC46WogCDr+alAXeehr4+Le9I2Zy/TIUCD1
         DF2ovWdsMHrodvIVEnvqDsyCF9qft1JJ5XeG03YSLn5nffwAQ+KIyKDSbXo5WxEFAQte
         RIbg==
X-Forwarded-Encrypted: i=1; AJvYcCWY+uoB3pWvk6cC3+ceqBhgrhSbduRDnmgPgz7S1Ko+hBWSg6vPBJU1ttM/iBp2/eMc5KKvYLLkCzQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwihGQTvUjpqlieTFKwVjTnlv30W+MlFwMbM6zLYt80FSXE13CE
	pEWHcZi/URI+Iw6jgeYN6oYwvEmpzkWktR1uqS5Zb9ug1e9WrWQm
X-Gm-Gg: ASbGnctgXiCjI5zLFnrhmZs+X8gFWlAAUoctNTBnTh2QvSrS35oSl4Q3fNMaTpYWUNU
	VdlyS3evZsKmM4FhYfn2ajHwiXiEOO9mhfsjVSSxSFUMz6iIAnIK0MrfFk66VRuhOZnKIFzcWpj
	DdNH3/gqbAyCL6CfY97WRzUQR+WrlIWDvsQSa8NApzocf0uzhDFYN0FxoH12V/6qB0SXzuRcyf7
	3UkzCQ6z8eqUiK3kuHsaVzFdIpthvvVUz/cegwqmFswDI2B7IJhzJGctcRPmpDDfAmo1vg59Zbu
	R/UcYwMaRpOIhlCV0cRkUCEXWH9HEosrhsDEN98AWmwKXN0u1KVMOkwb7rKo28GV4teA
X-Google-Smtp-Source: AGHT+IGEA9hhRRBDeyzG4WkKt+49d7gFcuvCU6+XKMxeG2gY6BreZ4BlmPPM+Kdczsk2MzNQJdHAMw==
X-Received: by 2002:a05:6a00:4606:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-73bafd708c5mr4555757b3a.24.1744222541802;
        Wed, 09 Apr 2025 11:15:41 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2ae8dsm1728722b3a.18.2025.04.09.11.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:15:41 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:15:30 +0800
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
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
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
Message-ID: <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_amQp3gK5Dm8Qz3@yury>

On Wed, Apr 09, 2025 at 12:54:35PM -0400, Yury Norov wrote:
> On Wed, Apr 09, 2025 at 11:43:43PM +0800, Kuan-Wei Chiu wrote:
> > Several parts of the kernel contain open-coded and redundant
> > implementations of parity calculation. This patch series introduces
> > a unified helper, parity_odd(), to simplify and standardize these
> > cases.
> > 
> > The first patch renames parity8() to parity_odd(), changes its argument
> 
> Alright, if it's an extension of the area of applicability, it should be
> renamed to just parity(). I already shared a table that summarized the
> drivers authors' view on that, and they clearly prefer not to add the
> suffix - 13 vs 2. The __builtin_parity() doesn't care of suffix as well. 
> 
> https://lore.kernel.org/all/Z9GtcNJie8TRKywZ@thinkpad/
> 
> Yes, the argument that boolean function should explain itself sounds
> correct, but in this case, comment on top of the function looks enough
> to me.
> 
> The existing codebase doesn't care about the suffix as well. If no
> strong preference, let's just pick a short and sweet name?
> 
I don't have a strong preference for the name, but if I had to guess
the return value from the function prototype, I would intuitively
expect an int to return "0 for even and 1 for odd," and a bool to
return "true for even, false for odd." I recall Jiri and Jacob shared
similar thoughts, which is why I felt adding _odd could provide better
clarity.

However, I agree that if the kernel doc comment is clear, it might not
be a big issue. But David previously mentioned that he doesn't want to
rely on checking the function's documentation every time while reading
the code.

Regardless, I'm flexible as long as we all reach a consensus on the
naming.

> > type from u8 to u64 for broader applicability, and updates its return
> > type from int to bool to make its usage and return semantics more
> > intuitive-returning true for odd parity and false for even parity. It
> > also adds __attribute_const__ to enable compiler optimizations.
> 
> That's correct and nice, but can you support it with a bloat-o-meter's
> before/after and/or asm snippets? I also think it worth to be a separate
> patch, preferably the last patch in the series.
> 
I quickly tested it with the x86 defconfig, and it appears that the
generated code doesn't change. I forgot who requested the addition
during the review process, but I initially thought it would either
improve the generated code or leave it unchanged without significantly
increasing the source code size.

However, if there's no actual difference in the generated code, maybe
let's just remove it?

Regards,
Kuan-Wei

> > While more efficient implementations may exist, further optimization is
> > postponed until a use case in performance-critical paths arises.
> > 
> > Subsequent patches refactor various kernel components to replace
> > open-coded parity logic with the new helper, reducing code duplication
> > and improving consistency.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> > 
> > To H. Peter:
> > I understand your preference for a parity8/16/32/64() style interface,
> > and I agree that such a design would better accommodate potential
> > arch-specific implementations. However, I suspect there are very few,
> > if any, users who care about the performance of parity calculations
> > enough to warrant such optimizations. So my inclination is to defer any
> > arch-specific or optimized implementations until we see parity_odd()
> > being used in hot paths.
> > 
> > Changes in v4:
> > - Rename parity8() to parity_odd().
> > - Change the argument type from u8 to u64.
> > - Use a single parity_odd() function.
> > 
> > Changes in v3:
> > - Avoid using __builtin_parity.
> > - Change return type to bool.
> > - Drop parity() macro.
> > - Change parityXX() << y to !!parityXX() << y.
> > 
> > Changes in v2:
> > - Provide fallback functions for __builtin_parity() when the compiler
> >   decides not to inline it
> > - Use __builtin_parity() when no architecture-specific implementation
> >   is available
> > - Optimize for constant folding when val is a compile-time constant
> > - Add a generic parity() macro
> > - Drop the x86 bootflag conversion patch since it has been merged into
> >   the tip tree
> > 
> > v3: https://lore.kernel.org/lkml/20250306162541.2633025-1-visitorckw@gmail.com/
> > v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
> > v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/
> > 
> > Kuan-Wei Chiu (13):
> >   bitops: Change parity8() to parity_odd() with u64 input and bool
> >     return type
> >   media: media/test_drivers: Replace open-coded parity calculation with
> >     parity_odd()
> >   media: pci: cx18-av-vbi: Replace open-coded parity calculation with
> >     parity_odd()
> >   media: saa7115: Replace open-coded parity calculation with
> >     parity_odd()
> >   serial: max3100: Replace open-coded parity calculation with
> >     parity_odd()
> >   lib/bch: Replace open-coded parity calculation with parity_odd()
> >   Input: joystick - Replace open-coded parity calculation with
> >     parity_odd()
> >   net: ethernet: oa_tc6: Replace open-coded parity calculation with
> >     parity_odd()
> >   wifi: brcm80211: Replace open-coded parity calculation with
> >     parity_odd()
> >   drm/bridge: dw-hdmi: Replace open-coded parity calculation with
> >     parity_odd()
> >   mtd: ssfdc: Replace open-coded parity calculation with parity_odd()
> >   fsi: i2cr: Replace open-coded parity calculation with parity_odd()
> >   nfp: bpf: Replace open-coded parity calculation with parity_odd()
> > 
> >  arch/x86/kernel/bootflag.c                    |  4 +--
> >  drivers/fsi/fsi-master-i2cr.c                 | 20 +++------------
> >  .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 ++----
> >  drivers/hwmon/spd5118.c                       |  2 +-
> >  drivers/i3c/master/dw-i3c-master.c            |  2 +-
> >  drivers/i3c/master/i3c-master-cdns.c          |  2 +-
> >  drivers/i3c/master/mipi-i3c-hci/dat_v1.c      |  2 +-
> >  drivers/input/joystick/grip_mp.c              | 17 ++-----------
> >  drivers/input/joystick/sidewinder.c           | 25 ++++---------------
> >  drivers/media/i2c/saa7115.c                   | 12 ++-------
> >  drivers/media/pci/cx18/cx18-av-vbi.c          | 12 ++-------
> >  .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 ++----
> >  drivers/mtd/ssfdc.c                           | 20 +++------------
> >  drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +-----
> >  drivers/net/ethernet/oa_tc6.c                 | 19 +++-----------
> >  .../broadcom/brcm80211/brcmsmac/dma.c         | 18 ++-----------
> >  drivers/tty/serial/max3100.c                  |  3 ++-
> >  include/linux/bitops.h                        | 19 ++++++++------
> >  lib/bch.c                                     | 14 +----------
> >  19 files changed, 49 insertions(+), 165 deletions(-)
> 
> OK, now it looks like a nice consolidation and simplification of code
> base. Thanks for the work.
> 
> Thanks,
> Yury
