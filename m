Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F301256C9B
	for <brcm80211@lists.linux.dev>; Wed, 12 Mar 2025 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741794677; cv=none; b=oSDplkFGznEYieA1FhNkVT4ECkqamxoTgm6whfDuo8tw9x4LqXRdkSbt2sWDabQiDOiel/bLCTKPSuBBlJq1ou62O20dCOXU0w3q/gFKGtT2T+NaKlrsOcoHf8TvSl/vJwhptK9Mu/AI2JXKmMenBSvFPt/LXGOG7juLvLsZp20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741794677; c=relaxed/simple;
	bh=1QU3OH9eZMlUtmRDEa6htdxVgD9Uk7DCLYLxId7vWJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xjwgn6Fi/qK7nVLlJsRug35hZ/8m7U8ovdqGeR8WNILlolbTG8P5+Q2MUKezO28q7Yh/baKU4rJRVTBBpWZVZ5wtprTQyvupdOF0gZ25azpYFe+IWAMBhB9Y5GltFp4PDpa57TnFjCRmQ5nnSy9s+dDKcgPORDTGRE0spD1R78I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgjJ9Lx7; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgjJ9Lx7"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso48034a91.3
        for <brcm80211@lists.linux.dev>; Wed, 12 Mar 2025 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741794675; x=1742399475; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s6kcU/jqWnvmgUYRTSnCwjipLLOVfnhjvRKH7bJe2iA=;
        b=RgjJ9Lx74r01CKZZEYkhgFpLcxKC10ATjYJInQV+WxH4/d1eFIzaiXgniw4ilo6otB
         g8PeDcCtuxmn3NyOrFhyEdayv1LQZTvBlMeVE2COdfSaSOdUoSoavd8x6ql0OAowjpIh
         fNKzo5Xlgxjv6BycWbcUeO1CS8EwHtXGwIQSYWkV2ewlcXKHdK0tf6ifpv1OSGdvtoPS
         5CIecz6zx3BTDIf4eBYVzD6GhRwHQFQuqjo6DSy9TAKiSdFr3hVl1vJEMarT63LjQway
         7rmGFtwlxpx9S+HoC2GtYM+Z4iFAyoiWgFfS6Q4xoTfgxXegE3asPGJPdgPXGn3Zttyw
         27SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741794675; x=1742399475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6kcU/jqWnvmgUYRTSnCwjipLLOVfnhjvRKH7bJe2iA=;
        b=r/aojlPjK9G0bgjnGqzK3F8TfdxJjQo0jhyXTzL8qwrXvHAw/wRTi5rMqWOcme/HuF
         mK3k/xXOhuUH5JBG5mzeHpLVDGnmsvpyE16q+toCUqQSt3KJx/CbA2vmvgdpPgcdRUq7
         uy0/O4ASfit+saXpbf1MiGqIFx4jy71ENU+NjwlR+NFC+5T2rrXvrjjuY/cCBbzQl7fL
         dQlFwxBqOOLLUA89r3fInCH6D/T41Ruf3DV5bGCXBrfKN9TRv+8gvJBOIAWJ51XPjd9e
         ueKCQg+k9ILRjp/VraSz2LnrhAeZrcTqGjvRkub/EUVX63j9k1KK/hHMD1W9+/ExaVIQ
         pJBg==
X-Forwarded-Encrypted: i=1; AJvYcCXaTuoP2FOd0JtXW5016eh2GuUzQxl5s0hgI9FWAYJO19M8T2GsUOkYR1aPo15Osw2p7YaYFz8HMm4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxV1pr0jlj+azRnpX6vnCNMNfrKoikcu4avwdsOKhxEzqJNyAhW
	99wVPZU6/fEW9yEONgRtVgPuEONimglkpwgcmbfCDuUkCEZmzfIB
X-Gm-Gg: ASbGnct47PG4E8uOMphAxKHsfUVMJ+p4HO0dBzxxvyFYwSYp6SkN9ucXUjIjGhPrqAL
	32/LD39hTDXgof0KhEImCcKAg+4olv/ct9qYMScC4ENmzzLJqGG1GLjbRMdQ1coIameoeOxw6zg
	XE7mKYY3FCynyzLO5DzOW6tkUCjJf6vpbLAUTfmAwDCdxNqjRkfDhaud2roR6eSC6AzRLOt94GW
	LpWsaKfYpFcBaxN6ddkvvE1BTOGEtmusxlSdo1w4T5gP/b6L4BUMLGElf1wW1mQjw9MTKT+TbtR
	3aqt6TnQQsKICdMjSrcbB9Djc/A2y1EE0irBnQ4tzxmm
X-Google-Smtp-Source: AGHT+IGK1wYMGzHFc5cibW/rOHObEUL/txoAjaO3YQm2mzlBBY39pOgAZq4ZVPE3dzf2E+KcMNlzyw==
X-Received: by 2002:a17:90a:a009:b0:301:1d03:93cd with SMTP id 98e67ed59e1d1-3011d039a52mr3747173a91.24.1741794675252;
        Wed, 12 Mar 2025 08:51:15 -0700 (PDT)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301182181c3sm1955502a91.5.2025.03.12.08.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 08:51:14 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:51:12 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
	arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
	bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
	davem@davemloft.net, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	edumazet@google.com, eleanor15x@gmail.com,
	gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
	jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
	jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux@rasmusvillemoes.dk, louis.peens@corigine.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
	neil.armstrong@linaro.org, netdev@vger.kernel.org,
	oss-drivers@corigine.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, rfoss@kernel.org,
	richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z9GtcNJie8TRKywZ@thinkpad>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>

On Tue, Mar 11, 2025 at 03:24:14PM -0700, H. Peter Anvin wrote:
> On March 11, 2025 3:01:30 PM PDT, Yury Norov <yury.norov@gmail.com> wrote:
> >On Sun, Mar 09, 2025 at 11:48:26PM +0800, Kuan-Wei Chiu wrote:
> >> On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
> >> > On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
> >> > >On Fri, 07 Mar 2025 11:30:35 -0800
> >> > >"H. Peter Anvin" <hpa@zytor.com> wrote:
> >> > >
> >> > >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> > >> >> (int)true most definitely is guaranteed to be 1.  
> >> > >> >
> >> > >> >That's not technically correct any more.
> >> > >> >
> >> > >> >GCC has introduced hardened bools that intentionally have bit patterns
> >> > >> >other than 0 and 1.
> >> > >> >
> >> > >> >https://gcc.gnu.org/gcc-14/changes.html
> >> > >> >
> >> > >> >~Andrew  
> >> > >> 
> >> > >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
> >> > >> for compiler-generated conversations that's still a given, or the manager isn't C
> >> > >> or anything even remotely like it.
> >> > >> 
> >> > >
> >> > >The whole idea of 'bool' is pretty much broken by design.
> >> > >The underlying problem is that values other than 'true' and 'false' can
> >> > >always get into 'bool' variables.
> >> > >
> >> > >Once that has happened it is all fubar.
> >> > >
> >> > >Trying to sanitise a value with (say):
> >> > >int f(bool v)
> >> > >{
> >> > >	return (int)v & 1;
> >> > >}    
> >> > >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
> >> > >
> >> > >I really don't see how using (say) 0xaa and 0x55 helps.
> >> > >What happens if the value is wrong? a trap or exception?, good luck recovering
> >> > >from that.
> >> > >
> >> > >	David
> >> > 
> >> > Did you just discover GIGO?
> >> 
> >> Thanks for all the suggestions.
> >> 
> >> I don't have a strong opinion on the naming or return type. I'm still a
> >> bit confused about whether I can assume that casting bool to int always
> >> results in 0 or 1.
> >> 
> >> If that's the case, since most people prefer bool over int as the
> >> return type and some are against introducing u1, my current plan is to
> >> use the following in the next version:
> >> 
> >> bool parity_odd(u64 val);
> >> 
> >> This keeps the bool return type, renames the function for better
> >> clarity, and avoids extra maintenance burden by having just one
> >> function.
> >> 
> >> If I can't assume that casting bool to int always results in 0 or 1,
> >> would it be acceptable to keep the return type as int?
> >> 
> >> Would this work for everyone?
> >
> >Alright, it's clearly a split opinion. So what I would do myself in
> >such case is to look at existing code and see what people who really
> >need parity invent in their drivers:
> >
> >                                     bool      parity_odd
> >static inline int parity8(u8 val)       -               -
> >static u8 calc_parity(u8 val)           -               -
> >static int odd_parity(u8 c)             -               +
> >static int saa711x_odd_parity           -               +
> >static int max3100_do_parity            -               -
> >static inline int parity(unsigned x)    -               -
> >static int bit_parity(u32 pkt)          -               -
> >static int oa_tc6_get_parity(u32 p)     -               -
> >static u32 parity32(__le32 data)        -               -
> >static u32 parity(u32 sample)           -               -
> >static int get_parity(int number,       -               -
> >                      int size)
> >static bool i2cr_check_parity32(u32 v,  +               -
> >                        bool parity)
> >static bool i2cr_check_parity64(u64 v)  +               -
> >static int sw_parity(__u64 t)           -               -
> >static bool parity(u64 value)           +               -
> >
> >Now you can refer to that table say that int parity(uXX) is what
> >people want to see in their drivers.
> >
> >Whichever interface you choose, please discuss it's pros and cons.
> >What bloat-o-meter says for each option? What's maintenance burden?
> >Perf test? Look at generated code?
> >
> >I personally for a macro returning boolean, something like I
> >proposed at the very beginning.
> >
> >Thanks,
> >Yury
> 
> Also, please at least provide a way for an arch to opt in to using the builtins, which seem to produce as good results or better at least on some architectures like x86 and probably with CPU options that imply fast popcnt is available.

Yeah. And because linux/bitops.h already includes asm/bitops.h
the simplest way would be wrapping generic implementation with
the #ifndef parity, similarly to how we handle find_next_bit case.

So:
1. Kuan-Wei, please don't invent something like ARCH_HAS_PARITY;
2. This may, and probably should, be a separate follow-up series,
   likely created by corresponding arch experts.

Thanks,
Yury
