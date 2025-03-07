Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727291A2C0B
	for <brcm80211@lists.linux.dev>; Fri,  7 Mar 2025 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339195; cv=none; b=ddSsx+CWT/s0cn1vqGsbHrQLP5HWmU9za8b88VgBNweMNETz7FzZeknpwl/vI/ZCaR4D5vO+Jqor7XAfkXIq1ZTDnAkI6oS06eNXCJhiEcaPLR+FHx1BEM1Bus+tcMAwg2C+c7adnAGxb51QT2qlZyl6588tS6Rcn0X4H9hsdEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339195; c=relaxed/simple;
	bh=OG/CetXrpMB0hGKQe7gnC7v3J5MYZEQQ0l9CYiQQhpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0jl1kM1cXEzAGHP6bUFni9I7Itlv5/2Poy/edcNZusw3iW1jf1l3TRj9sY849Fw3zGNLISIrm6AJZWL3YcfL0ZsnNHxCd578t9D/qOZ/jS/mlioe8Npv4X+bSHXFIqxbarCFIsRe0VX9STMg6ut/AFDG3CkjZW0BqLOUwDXloM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+In40eR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+In40eR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fb0f619dso31710945ad.1
        for <brcm80211@lists.linux.dev>; Fri, 07 Mar 2025 01:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741339193; x=1741943993; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WtFm3fAnjeubhbuWCpwfNvD+r/QsDLeKl5ss4JFiMbs=;
        b=T+In40eRAXwLcXDqj3QePaBn4Z68VS0pmLfYfMY3Ydh62E6FLiiBMWPyupvkNxC6r6
         SRud+KFgfJBITRNzC//rqa/wAbAd8pLdjw1hlbVZ0CQuPgR87N+nL9Oi4MlRnCCfQS/Z
         gIWte8SVGk/+DnzQkVYwr0YxxhHyoTLmv0tEGp++ADtd7y2Kw8cB+Py3+wKv7HzTOCvb
         oQL1EiqqSPxpwKYhuKphJoYnuVL0lyPz0vAR1je/rDjWMSUiW2YQZJ4siBjmb2qlHi4E
         D3ZQXt33tPSvcXNH8uDlaP3puFC4WxoBD0YlPdO3jvys+/Qu7zbWl/qWQoR7dQn7c5IW
         EA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339193; x=1741943993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtFm3fAnjeubhbuWCpwfNvD+r/QsDLeKl5ss4JFiMbs=;
        b=RuXrF3fG6uo/nPHsalJFCwvySRrhNpe7Vtj7i83kLth4Lvmqzjvze3Apc0bpm8LPLs
         FBBQ/X+hQYpqKv5kuWTnD7fIjKKM1pgO9BZHivl7sEb6d24KJTVIfWyU9V2ciN3GcNEU
         fv0bw0i1xVvrHBxtPFsXMXZZcTHR3pFdoqbltEaV4woZd4Lid3evlmikhvE81pm5FMlO
         L62cO6r+U9Iw7usFDM5T5CvDbNp+BFBIG3XioI+wimUf50laAeKPbFq/jqCdjTVQm4Bm
         2zk15F6hVVptYg4GI8HZJEn86NJyxF6MJTHdGq5sEfbRyqQuDV2V7OhPdHvA4qkrXo9E
         x0eA==
X-Forwarded-Encrypted: i=1; AJvYcCUIL+CwAXJWdCsPBSpmJtT4p/OKJQTwfw1RJwUzT05B/5JucNN+F565e5MfhiBzWmmq+xO5334rtmM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP3K+18UQ/M30PjR/YroLJGN4wh/9/I0Jq1RLtSpvYGdAl+cZZ
	LrrWqhviKvzTDOvcGOwBEwFZAhxsyTCi51VcBfzsW99y4W9ZAKet
X-Gm-Gg: ASbGnct+nhUV6cHwdeKWJuCtEuaNGk1Ujkuplb0jxj6WqXmnXyW8tdvCTgpBeenGILi
	ep0VM/i6sam4fSBAOvl36/8zpMOiTr4WS5Xvug0ApPxw8+VjkLV1vmhZP7rsYN/ABdQLC0tik0M
	RmTNg1PYxrDiIIBBpjw3qF+6K/S5CDbToePge4nNYs5+mDsMFV1tapXMPtLh6/Ip+8XfxN2OfMt
	xNdhIqFxRbyjwqtqtVsfhQOrTyLf/Xx0CAcAmai/xp1PoBZenP1aNHXB+03C7GVX5f6juxiwAxR
	2FATw+F16HkswGDboxZFWvQg9A40poq6li8xUEyEdwG4x6LfCVIbnq7j5Qo1PknekzQtL9fb
X-Google-Smtp-Source: AGHT+IE3b9zkIaLC0mzOF8WD1s1QYwmhsrk+TIJsgXANJenF5GXtHRIhAmThoWOF8+4okLgNhjrCPg==
X-Received: by 2002:a05:6a20:9381:b0:1ee:cdda:b8f8 with SMTP id adf61e73a8af0-1f544acb430mr5633011637.7.1741339192556;
        Fri, 07 Mar 2025 01:19:52 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698243f21sm2854684b3a.52.2025.03.07.01.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:19:51 -0800 (PST)
Date: Fri, 7 Mar 2025 17:19:42 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>, longman@redhat.com, llong@redhat.com
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
	jirislaby@kernel.org, yury.norov@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8q6LlkQDG95Amgw@visitorckw-System-Product-Name>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <F134DC06-54DE-4B8E-8AE0-3740275835C1@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F134DC06-54DE-4B8E-8AE0-3740275835C1@zytor.com>

+Cc Waiman Long for bool cast to int discussion

Hi Peter,

On Thu, Mar 06, 2025 at 07:14:13PM -0800, H. Peter Anvin wrote:
> On March 6, 2025 8:25:25 AM PST, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> >Several parts of the kernel contain redundant implementations of parity
> >calculations for 16/32/64-bit values. Introduces generic
> >parity16/32/64() helpers in bitops.h, providing a standardized
> >and optimized implementation. 
> >
> >Subsequent patches refactor various kernel components to replace
> >open-coded parity calculations with the new helpers, reducing code
> >duplication and improving maintainability.
> >
> >Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >---
> >In v3, I use parityXX() instead of the parity() macro since the
> >parity() macro may generate suboptimal code and requires special hacks
> >to make GCC happy. If anyone still prefers a single parity() macro,
> >please let me know.
> >
> >Additionally, I changed parityXX() << y users to !!parityXX() << y
> >because, unlike C++, C does not guarantee that true casts to int as 1.
> >
> >Changes in v3:
> >- Avoid using __builtin_parity.
> >- Change return type to bool.
> >- Drop parity() macro.
> >- Change parityXX() << y to !!parityXX() << y.
> >
> >
> >Changes in v2:
> >- Provide fallback functions for __builtin_parity() when the compiler
> >  decides not to inline it
> >- Use __builtin_parity() when no architecture-specific implementation
> >  is available
> >- Optimize for constant folding when val is a compile-time constant
> >- Add a generic parity() macro
> >- Drop the x86 bootflag conversion patch since it has been merged into
> >  the tip tree
> >
> >v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
> >v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/
> >
> >Kuan-Wei Chiu (16):
> >  bitops: Change parity8() return type to bool
> >  bitops: Add parity16(), parity32(), and parity64() helpers
> >  media: media/test_drivers: Replace open-coded parity calculation with
> >    parity8()
> >  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
> >    parity8()
> >  media: saa7115: Replace open-coded parity calculation with parity8()
> >  serial: max3100: Replace open-coded parity calculation with parity8()
> >  lib/bch: Replace open-coded parity calculation with parity32()
> >  Input: joystick - Replace open-coded parity calculation with
> >    parity32()
> >  net: ethernet: oa_tc6: Replace open-coded parity calculation with
> >    parity32()
> >  wifi: brcm80211: Replace open-coded parity calculation with parity32()
> >  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
> >    parity32()
> >  mtd: ssfdc: Replace open-coded parity calculation with parity32()
> >  fsi: i2cr: Replace open-coded parity calculation with parity32()
> >  fsi: i2cr: Replace open-coded parity calculation with parity64()
> >  Input: joystick - Replace open-coded parity calculation with
> >    parity64()
> >  nfp: bpf: Replace open-coded parity calculation with parity64()
> >
> > drivers/fsi/fsi-master-i2cr.c                 | 18 ++-----
> > .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 +--
> > drivers/input/joystick/grip_mp.c              | 17 +-----
> > drivers/input/joystick/sidewinder.c           | 24 ++-------
> > drivers/media/i2c/saa7115.c                   | 12 +----
> > drivers/media/pci/cx18/cx18-av-vbi.c          | 12 +----
> > .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 +--
> > drivers/mtd/ssfdc.c                           | 20 ++-----
> > drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +--
> > drivers/net/ethernet/oa_tc6.c                 | 19 ++-----
> > .../broadcom/brcm80211/brcmsmac/dma.c         | 16 +-----
> > drivers/tty/serial/max3100.c                  |  3 +-
> > include/linux/bitops.h                        | 52 +++++++++++++++++--
> > lib/bch.c                                     | 14 +----
> > 14 files changed, 77 insertions(+), 153 deletions(-)
> >
> 
> !!x is used with a value that is not necessary booleanized already, and is exactly equivalent to (x ? true : false). It is totally redundant on a value known to be bool.
> 
I used to believe that casting a boolean variable to int would always
result in 0 or 1 until a few months ago when Waiman Long explicitly
pointed out during a review that C does not guarantee this.

So I revisited the C11 standard, which states that casting to _Bool
always results in 0 or 1 [1]. Another section specifies that bool,
true, and false are macros defined in <stdbool.h>, with true expanding
to 1 and false to 0. However, these macros can be #undef and redefined
to other values [2]. I'm not sure if this is sufficient to conclude
that casting bool to int will always result in 0 or 1, but if the
consensus is that it does, I'll remove the !! hack in the next version.

> If (int)true wasn't inherently 1, then !! wouldn't work either. 
> 
The C standard guarantees that the ! operator returns an int, either 0
or 1. So regardless of how true casts, using !! should work. Right?

> There was a time when some code would use as a temporary hack: 
> 
> typedef enum { false, true } bool;
> 
> ... when compiling on pre-C99 compilers; in that case a (bool) case wouldn't necessarily work as expected, whereas !! would. Furthermore, unlike (bool), !! works in the preprocessor.

I'm not entirely sure how !! works in the preprocessor. I always
thought it was handled by the compiler. Could you elaborate on this?

Regards,
Kuan-Wei

[1]: 6.3.1.2 Boolean type
1 When any scalar value is converted to _Bool, the result is 0 if the value compares equal
to 0; otherwise, the result is 1.59)

[2]: 7.18 Boolean type and values <stdbool.h>
1 The header <stdbool.h> defines four macros.
2 The macro
bool
expands to _Bool.
3 The remaining three macros are suitable for use in #if preprocessing directives. They
are
true
which expands to the integer constant 1,
false
which expands to the integer constant 0, and
_ _bool_true_false_are_defined
which expands to the integer constant 1.
4 Notwithstanding the provisions of 7.1.3, a program may undefine and perhaps then
redefine the macros bool, true, and false.
259)
