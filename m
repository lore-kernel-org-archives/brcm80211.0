Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE38E1DFFC
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 16:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217680; cv=none; b=pQyWU41/muaGeETzRjA82yYb1/fPNrxIDg1WYGaGgb2T3Ax2H43UoZUsKgDA3irqON9KtVBTYJoa4SaXBtLiEI59vIyhYWPTeRVdMHTMS5tVzC/tGJIi3QH/8at/w5LXDXI6HoMHdtUQc6UrmfCzRmqDsyMRPzqTElZl8JlV6zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217680; c=relaxed/simple;
	bh=g8tG3x/iWwTVg7jN8iiBSCQ0/dwqSuIjotBmyUKOwao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mluqk9E9Vr1l08e5q0gjgE5zFXWNym/sjVSs+D1Exf6FI1j+MPsmp3Wi6xWfDDzYmnjMzffxW5zhSTw7edXehP1JlJB8/TyL8mZS2VgxDEDa0fwJJk1cRAYxBogLdUgxegPqH8BXcICA0pR/mtmiIAeO+xcXTwJwQTUUbUr8ql0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awFymr0z; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awFymr0z"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2241053582dso91916405ad.1
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744217678; x=1744822478; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CKpfWxOAsmcqfHthdu26r7YWnYaeAaQXRASkSMsz97E=;
        b=awFymr0zOfzJgRU/1NdosprKshWjQx6Fiah6eWYtOSXFDxRolPhUJv3jU6gjyQld8U
         vBqgGMYOm1ZumkWdQcZ+g00PLDGgy6eODZUFviSe6CxZppVLHRMDIe73qg3K5PVVA14m
         7G5xivJ9eotBk1wsRKl0atQ/kt4m3l0IlDYrcmgNUJoWi14Vu6hb1Cep+oecjKz+lgsd
         +cBJtZf5pnAILgS+9BXQRv+sUtBNCPAMzWD35eybR01lxuO7Y93Qpka6n9AzvGixCJE1
         A33Ifl7akG89pUjLmJ7Z3y4xCuTXVf0DJ07fM7gISUCISn0h4efjc1s/kfsmkMlWFWQM
         qDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217678; x=1744822478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKpfWxOAsmcqfHthdu26r7YWnYaeAaQXRASkSMsz97E=;
        b=IXkmiVLA+gjyuBRsDslVfdiUGgQzne7GvTJTMXEpnk7IFoQg4Ip3k+eLF2fy3wJj19
         HUWzhB9Qr1ZT5ZsVvpUAX3kMx1Yw5CmymCiB1MqC03KQw21o3qE9RbUtD8l0WA9Ysw7K
         zPNOftog+2Wive6/STaudxOsszZXVl3qJ4nQzjyi3dt1CnfvZ14Qf+Q/PtiAE3juJqfn
         VRC2V8vlT3YoJLRrhBs7bJeklC6R/AmlSOV/MMKFhpshm707BstalaRbeuNbtEan9roI
         oQVfWGq8KZd/0k1AJBSg/UDGurX25zylnBb4FW9sPGtheGyvK+SkIqNvD+CXMIsoC45W
         tbiA==
X-Forwarded-Encrypted: i=1; AJvYcCXHCkj1dnoN4EBaEo9oSHcxlPX7Mh8NgUbmLI4up5bM0jbmx+Ngvs/E65336r2OO2NesK7nghgULFI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWjquq4aeuaYbIuoeSBbgsJ63ecyXWhQ6+OkIU8LOdmrHQB8hR
	LM4AoCCiE3BjMo7u1Il0PcefCTLIrWd8SLFH3ZjMAQNHru7Gemdq
X-Gm-Gg: ASbGncvbNnJfCuOIO/Zw/VYqBL53H/7zgYhnA7wShNzJFUaSPPAVOhG463tx0xn1TMW
	FtVb7fJ0kMvktoPxjRnphhGpW36pgFrDLvWBtgsFV5seHxXt06zTDwdeUeKBDffaVi+y9BWXEgU
	Bx4HnNgtQMvadZHAIKJ69R7nCHXgW1fK6VEHT5axhCxWnv31m3rppiy84Oo2+Ze52MYyvRcmaAJ
	UblNhDmoraYojs9qofhtHtpvpzPZEwxLYUkXZ/iXcfItObvfCPabohlMPO9GuXxSKQ4VG1h65fN
	N4UU4ugVJl/8mTD/bb32v8TCOWECOCui7XmJ2q+n
X-Google-Smtp-Source: AGHT+IFxnZTQiwyLnCcrMyVoc4gjX/wlLeI10NLEVrusIoE84Mu0MqqI5oCBV9CkTcUXaP/nQxUz2g==
X-Received: by 2002:a17:903:240b:b0:224:1579:5e91 with SMTP id d9443c01a7336-22ac40026bbmr47037845ad.47.1744217677709;
        Wed, 09 Apr 2025 09:54:37 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df4011dbsm1856612a91.46.2025.04.09.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 09:54:36 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:54:35 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
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
Message-ID: <Z_amQp3gK5Dm8Qz3@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>

On Wed, Apr 09, 2025 at 11:43:43PM +0800, Kuan-Wei Chiu wrote:
> Several parts of the kernel contain open-coded and redundant
> implementations of parity calculation. This patch series introduces
> a unified helper, parity_odd(), to simplify and standardize these
> cases.
> 
> The first patch renames parity8() to parity_odd(), changes its argument

Alright, if it's an extension of the area of applicability, it should be
renamed to just parity(). I already shared a table that summarized the
drivers authors' view on that, and they clearly prefer not to add the
suffix - 13 vs 2. The __builtin_parity() doesn't care of suffix as well. 

https://lore.kernel.org/all/Z9GtcNJie8TRKywZ@thinkpad/

Yes, the argument that boolean function should explain itself sounds
correct, but in this case, comment on top of the function looks enough
to me.

The existing codebase doesn't care about the suffix as well. If no
strong preference, let's just pick a short and sweet name?

> type from u8 to u64 for broader applicability, and updates its return
> type from int to bool to make its usage and return semantics more
> intuitive-returning true for odd parity and false for even parity. It
> also adds __attribute_const__ to enable compiler optimizations.

That's correct and nice, but can you support it with a bloat-o-meter's
before/after and/or asm snippets? I also think it worth to be a separate
patch, preferably the last patch in the series.

> While more efficient implementations may exist, further optimization is
> postponed until a use case in performance-critical paths arises.
> 
> Subsequent patches refactor various kernel components to replace
> open-coded parity logic with the new helper, reducing code duplication
> and improving consistency.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> 
> To H. Peter:
> I understand your preference for a parity8/16/32/64() style interface,
> and I agree that such a design would better accommodate potential
> arch-specific implementations. However, I suspect there are very few,
> if any, users who care about the performance of parity calculations
> enough to warrant such optimizations. So my inclination is to defer any
> arch-specific or optimized implementations until we see parity_odd()
> being used in hot paths.
> 
> Changes in v4:
> - Rename parity8() to parity_odd().
> - Change the argument type from u8 to u64.
> - Use a single parity_odd() function.
> 
> Changes in v3:
> - Avoid using __builtin_parity.
> - Change return type to bool.
> - Drop parity() macro.
> - Change parityXX() << y to !!parityXX() << y.
> 
> Changes in v2:
> - Provide fallback functions for __builtin_parity() when the compiler
>   decides not to inline it
> - Use __builtin_parity() when no architecture-specific implementation
>   is available
> - Optimize for constant folding when val is a compile-time constant
> - Add a generic parity() macro
> - Drop the x86 bootflag conversion patch since it has been merged into
>   the tip tree
> 
> v3: https://lore.kernel.org/lkml/20250306162541.2633025-1-visitorckw@gmail.com/
> v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
> v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/
> 
> Kuan-Wei Chiu (13):
>   bitops: Change parity8() to parity_odd() with u64 input and bool
>     return type
>   media: media/test_drivers: Replace open-coded parity calculation with
>     parity_odd()
>   media: pci: cx18-av-vbi: Replace open-coded parity calculation with
>     parity_odd()
>   media: saa7115: Replace open-coded parity calculation with
>     parity_odd()
>   serial: max3100: Replace open-coded parity calculation with
>     parity_odd()
>   lib/bch: Replace open-coded parity calculation with parity_odd()
>   Input: joystick - Replace open-coded parity calculation with
>     parity_odd()
>   net: ethernet: oa_tc6: Replace open-coded parity calculation with
>     parity_odd()
>   wifi: brcm80211: Replace open-coded parity calculation with
>     parity_odd()
>   drm/bridge: dw-hdmi: Replace open-coded parity calculation with
>     parity_odd()
>   mtd: ssfdc: Replace open-coded parity calculation with parity_odd()
>   fsi: i2cr: Replace open-coded parity calculation with parity_odd()
>   nfp: bpf: Replace open-coded parity calculation with parity_odd()
> 
>  arch/x86/kernel/bootflag.c                    |  4 +--
>  drivers/fsi/fsi-master-i2cr.c                 | 20 +++------------
>  .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 ++----
>  drivers/hwmon/spd5118.c                       |  2 +-
>  drivers/i3c/master/dw-i3c-master.c            |  2 +-
>  drivers/i3c/master/i3c-master-cdns.c          |  2 +-
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c      |  2 +-
>  drivers/input/joystick/grip_mp.c              | 17 ++-----------
>  drivers/input/joystick/sidewinder.c           | 25 ++++---------------
>  drivers/media/i2c/saa7115.c                   | 12 ++-------
>  drivers/media/pci/cx18/cx18-av-vbi.c          | 12 ++-------
>  .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 ++----
>  drivers/mtd/ssfdc.c                           | 20 +++------------
>  drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +-----
>  drivers/net/ethernet/oa_tc6.c                 | 19 +++-----------
>  .../broadcom/brcm80211/brcmsmac/dma.c         | 18 ++-----------
>  drivers/tty/serial/max3100.c                  |  3 ++-
>  include/linux/bitops.h                        | 19 ++++++++------
>  lib/bch.c                                     | 14 +----------
>  19 files changed, 49 insertions(+), 165 deletions(-)

OK, now it looks like a nice consolidation and simplification of code
base. Thanks for the work.

Thanks,
Yury
