Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF529757EA
	for <brcm80211@lists.linux.dev>; Sun,  2 Mar 2025 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740931338; cv=none; b=D4QboEM0B7U7negmrN4AHjeb3NfSXWFxOT75k+8sQoY+Docin6XpS2ixk0Sfnry3NcPmkpJhTU9aMYOCTLyZ2MWag1AVfzP+Y+VHjtYNOmtm9DiDdVCVQGgK6azkcvPkcqBwwk5RXMkaueNg/HdC61vnaIukT4vsMWSmn7DxXmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740931338; c=relaxed/simple;
	bh=42nc8rGbs4ozsfj3Z5uw223OqXhRXX42NQdy9kalxow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJdBcguYpQWO8asw1USB69AVufa8zKf5nRlVPBsgHmOgzB5gLor2kwuYTFQtisGIR7k8LXBQt9igd1vYrkPOk2NXKcD/9aeWjFrJs6CdAkPAit125V3p2ev4BKn0aU+dQobIZ1rpz1qf9HhIMhvJBJulVnMzSFEk2aNjkBfFW5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yfk9S0Wi; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yfk9S0Wi"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e60b81c29c5so1276935276.1
        for <brcm80211@lists.linux.dev>; Sun, 02 Mar 2025 08:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740931336; x=1741536136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AqMp5vaYpnKO6cXrhbgbA0K1fLl4S3iWDDCzq3bGh4s=;
        b=Yfk9S0WijpB1kKA/NoqGhfDqne2i+kxetScSJLp2iKdPaPATS1R1hm9WHphopCFZpe
         DRuNmt3lx2aK7bY8th8sDuyezbYeGMSV1ojnJJEb+JxvM9WrXiZSb94gwLPjOlHIp/US
         kwUv7I332CrloDXYJx8UsQSqpFRI3SmEdccGXIRKUQV6qecKiUwBnpU/5IlpfZHgRbQD
         ysPYVxNf3bv0jv85K632URc50zb4ocnfq9cN8QLqN/0Nn+7tq/ign6oN4LBCq/6pCUoB
         vTBS6Uk3sh22ZdbQI9nnlbH7CA7eFAMb1Cj2/7zYN1T+aGzYQeDT3Nl2OuRAcDLFfJlv
         D/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740931336; x=1741536136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqMp5vaYpnKO6cXrhbgbA0K1fLl4S3iWDDCzq3bGh4s=;
        b=WRUZMfLegs+kWzEQ+naY+wVcxTIGU11ZC7mS3d/XeAjdpcjNJOsSfPjQpakkPlpqHR
         Sf5O6Iheyd8ouayEDcTWDyQIq7hRei3aTOYMnwZyGVTdmdeQIT7Hp+BqNQyVMJvsHjmF
         Doifujb4PfkKDOYJ6YC4DJJ0m8XKVIoOEPtBbYWo9GbVhZUcVlCHj4V7zNSReWttVK+R
         g1V9ul/rzf/MfnomLwauZGuFLuGrgEuX/oghuGOUrUtBDXvZjJUBQVJ/SdeSU99OUkQK
         qjxRHuQv1+iANot0cABLITc9t8X1GaUpJTrwIKk1X+1mTQECHe06v0ukfoflpQhMlTSl
         ogQA==
X-Forwarded-Encrypted: i=1; AJvYcCUNFUZ0/CJmkD0u8nz8/qcnoWIGBToe1+pjW5QwaPla/pEyw2buqoAh1vpLA+A3ZSxJXFsaHrNJ5vk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6sefeL0Wkil83dvEmKDnKIQ/eK+WYNY6sSTfgfG/a2RKanHIO
	duy0v4lJubqxypBYPcwm7hybV7P1NW2KnJipZCQTGpLuopHOVqq7
X-Gm-Gg: ASbGncsZcwajRz+oqI7n/h0p6u/7qxqjcf2Jq3DNT2YfdDAUNTcPHikugAMfcgda1MQ
	ZSYAv0zGL5E84LQWuUl2fTEvH4VAa8Zd/D/+2PDOpJPGK5r3NG4+SQbR8A+iG8YsZi1zV2hgQI8
	Hn+K2EoocfmCcVEq5Hx4y8fmTtIqPxCz02WTaff0bYxeDgBq/Hw41JLP5s7is24lPiaPsuObchE
	F9DyBnr2wkc20W4/y3Z5oqE94UMNdfZscoDd5R/vwbXX9cJ6ZZcwyyDDHC/PC68uLo1usLdJMfN
	uOj0irLu3rrFdMjySlKB5K8Z6gnXJGJyyZkMOVADOY/csUj/Yu5NUq8URNsUSp9u6iOkQ9CtJ84
	dqDo8
X-Google-Smtp-Source: AGHT+IGTA2Ffxb6HyDj6e6db1ev2VVk/M561S2KqXTIWcogd5CMLT4NZ5B2IRrPsjUAAQ5n/S5KqaA==
X-Received: by 2002:a05:6902:1089:b0:e60:88f9:b081 with SMTP id 3f1490d57ef6-e60b23f8464mr13571127276.17.1740931335559;
        Sun, 02 Mar 2025 08:02:15 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e60a3a417a6sm2354159276.28.2025.03.02.08.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 08:02:14 -0800 (PST)
Date: Sun, 2 Mar 2025 11:02:12 -0500
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
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8SBBM_81wyHfvC0@thinkpad>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>

On Sun, Mar 02, 2025 at 04:20:02PM +0800, Kuan-Wei Chiu wrote:
> Hi Yury,
> 
> On Sat, Mar 01, 2025 at 10:10:20PM -0500, Yury Norov wrote:
> > On Sat, Mar 01, 2025 at 10:23:52PM +0800, Kuan-Wei Chiu wrote:
> > > Add generic C implementations of __paritysi2(), __paritydi2(), and
> > > __parityti2() as fallback functions in lib/parity.c. These functions
> > > compute the parity of a given integer using a bitwise approach and are
> > > marked with __weak, allowing architecture-specific implementations to
> > > override them.
> > > 
> > > This patch serves as preparation for using __builtin_parity() by
> > > ensuring a fallback mechanism is available when the compiler does not
> > > inline the __builtin_parity().
> > > 
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > >  lib/Makefile |  2 +-
> > >  lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 49 insertions(+), 1 deletion(-)
> > >  create mode 100644 lib/parity.c
> > > 
> > > diff --git a/lib/Makefile b/lib/Makefile
> > > index 7bab71e59019..45affad85ee4 100644
> > > --- a/lib/Makefile
> > > +++ b/lib/Makefile
> > > @@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
> > >  	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
> > >  	 percpu-refcount.o rhashtable.o base64.o \
> > >  	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
> > > -	 generic-radix-tree.o bitmap-str.o
> > > +	 generic-radix-tree.o bitmap-str.o parity.o
> > >  obj-y += string_helpers.o
> > >  obj-y += hexdump.o
> > >  obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
> > > diff --git a/lib/parity.c b/lib/parity.c
> > > new file mode 100644
> > > index 000000000000..a83ff8d96778
> > > --- /dev/null
> > > +++ b/lib/parity.c
> > > @@ -0,0 +1,48 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * lib/parity.c
> > > + *
> > > + * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
> > > + * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
> > > + *
> > > + * __parity[sdt]i2 can be overridden by linking arch-specific versions.
> > > + */
> > > +
> > > +#include <linux/export.h>
> > > +#include <linux/kernel.h>
> > > +
> > > +/*
> > > + * One explanation of this algorithm:
> > > + * https://funloop.org/codex/problem/parity/README.html
> > 
> > I already asked you not to spread this link. Is there any reason to
> > ignore it?
> > 
> In v2, this algorithm was removed from bitops.h, so I moved the link
> here instead. I'm sorry if it seemed like I ignored your comment.

Yes, it is.
 
> In v1, I used the same approach as parity8() because I couldn't justify
> the performance impact in a specific driver or subsystem. However,
> multiple people commented on using __builtin_parity or an x86 assembly
> implementation. I'm not ignoring their feedback-I want to address these

Please ask those multiple people: are they ready to maintain all that
zoo of macros, weak implementations, arch implementations and stubs
for no clear benefit? Performance is always worth it, but again I see
not even a hint that the drivers care about performance. You don't
measure it, so don't care as well. Right?

> comments. Before submitting, I sent an email explaining my current
> approach: using David's suggested method along with __builtin_parity,
> but no one responded. So, I decided to submit v2 for discussion
> instead.

For discussion use tag RFC.

> 
> To avoid mistakes in v3, I want to confirm the following changes before
> sending it:
> 
> (a) Change the return type from int to bool.
> (b) Avoid __builtin_parity and use the same approach as parity8().
> (c) Implement parity16/32/64() as single-line inline functions that
>     call the next smaller variant after xor.
> (d) Add a parity() macro that selects the appropriate parityXX() based
>     on type size.
> (e) Update users to use this parity() macro.
> 
> However, (d) may require a patch affecting multiple subsystems at once
> since some places that already include bitops.h have functions named
> parity(), causing conflicts. Unless we decide not to add this macro in
> the end.
> 
> As for checkpatch.pl warnings, they are mostly pre-existing coding
> style issues in this series. I've kept them as-is, but if preferred,
> I'm fine with fixing them.

Checkpatch only complains on new lines. Particularly this patch should
trigger checkpatch warning because it adds a new file but doesn't touch
MAINTAINERS. 

> If anything is incorrect or if there are concerns, please let me know.
> 
> Regards,
> Kuan-Wei
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index c1cb53cf2f0f..47b7eca8d3b7 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -260,6 +260,43 @@ static inline int parity8(u8 val)
>  	return (0x6996 >> (val & 0xf)) & 1;
>  }
> 
> +static inline bool parity16(u16 val)
> +{
> +	return parity8(val ^ (val >> 8));
> +}
> +
> +static inline bool parity32(u32 val)
> +{
> +	return parity16(val ^ (val >> 16));
> +}
> +
> +static inline bool parity64(u64 val)
> +{
> +	return parity32(val ^ (val >> 32));
> +}

That was discussed between Jiri and me in v2. Fixed types functions
are needed only in a few very specific cases. With the exception of
I3C driver (which doesn't look good for both Jiri and me), all the
drivers have the type of variable passed to the parityXX() matching 
the actual variable length. It means that fixed-type versions of the
parity() are simply not needed. So if we don't need them, please don't
introduce it.

> +#define parity(val)			\
> +({					\
> +	bool __ret;			\
> +	switch (BITS_PER_TYPE(val)) {	\
> +	case 64:			\
> +		__ret = parity64(val);	\
> +		break;			\
> +	case 32:			\
> +		__ret = parity32(val);	\
> +		break;			\
> +	case 16:			\
> +		__ret = parity16(val);	\
> +		break;			\
> +	case 8:				\
> +		__ret = parity8(val);	\
> +		break;			\
> +	default:			\
> +		BUILD_BUG();		\
> +	}				\
> +	__ret;				\
> +})
> +
>  /**
>   * __ffs64 - find first set bit in a 64 bit word
>   * @word: The 64 bit word
