Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18995215062
	for <brcm80211@lists.linux.dev>; Mon,  3 Mar 2025 15:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014946; cv=none; b=WxLuENYPdJCW2hJgMmuOiO8CxG14DFoPX71wLvsdUX6PGlMvYNh+/Cz+DMe0AnP4z7cvVFfwTnM9WzYANeLbaNvI+nkGENHjHA6g0KUKwYd9jsabTN+mmHQSVBVNqpmxwIrih+0YYqa1BVby3MkQaKv98LDo33gK4SAkUqF74aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014946; c=relaxed/simple;
	bh=J/6FAEzfZUmcf3YQqpKE3PWJQodoKKL5y/1lxELhgyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7mzED++0o26CWwVwNiGta8WsjL7z7FUDGo+O4CKXx9EoSatmQe+1yrutg4iYWdF6K18KBJsDkhiiNEd/nKoKsID3/ACe3bPVyHxctOErlA9IvBN182WDth3KH89DrkpEe2tGYQjEtS93eWjhKBN675lvh3yZmTvKAxOux5Didg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W84gfzId; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W84gfzId"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6fd719f9e0dso10331677b3.1
        for <brcm80211@lists.linux.dev>; Mon, 03 Mar 2025 07:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741014943; x=1741619743; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vnZYfHRjSrDXnbFHbwXoqUV2Rvz3Z3oSLKKN3IWdcq0=;
        b=W84gfzIdTwbXUarQC1wIaEciTyFuL2jvoeQpAeWehzL6PNKMxCc4r1akLXEQZqw3kV
         hvIw6Pv9M8B+9V3LL1MugY4gC6bKUgDOVqgTsTFQ/CBVsh++sAu5tNGB5zl8/0CN51zf
         H7OPUI/BPLbFfGs1dW0Ck1Ye43jLTp1bVBI52CfG/aJ/jpdlSZ5cF4MhNYyij2mxKdxY
         MeMLWk7kVXSSXJuJQXpYbuh85uvpyUVwl3NSTvQhfNpC7bfKjJTH9XVijZAHU9GZeIn/
         dQ/sQaK/tIJNvmHVKqTyqHdpt9M1HfY8jPJmnbL5x3DIe+kUWW+KMiikoYkfq08FvfMx
         B8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014943; x=1741619743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnZYfHRjSrDXnbFHbwXoqUV2Rvz3Z3oSLKKN3IWdcq0=;
        b=mSuykt0xPsS+YgJDEkyZ12nrCeIU6ChuuEbLMyzrnxwK9u7AK9LODIlrxrcv0vZ3u/
         TAsHaWb8VGUQekDNS5PNOUdBG1ho7xoZ2k393Zf4VZbUVv8H1wbSSdUL3NXQZ31Pnlz2
         JgORezfuiI2/qaRrTmqVo4zwK4cjZ9tnD0BS9xZRBUvsQtfq9oso3jzh44M1M7O7WS4t
         ry8ilO4TQKf4s5a1967glqYFjiO5zslRh8IE9EBXvMTffRh40gOy4lFpreJa+/L4cK5n
         3bVoCjbc3jhbWSLEgJomsAEinBu7xG+Wx+VWp2tBkf7tNc1C7Lyq3+sUAuiwDXuMHYHn
         rdjA==
X-Forwarded-Encrypted: i=1; AJvYcCXfS9+PW9H7mXyyuGji5aQB+XiM3a33ufNaVyJ3nHFEIHmWWTFB4TiyYDboIRdgtuDBLhJqKA6zo+E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGnzcJWSTKLVhThAkdxR1RZoiOgwqSZza7HOAxHGDRwJPWLE1n
	KoziGLhMTN7QQ/531YhXHydFaqGd5bMX/11xOqLFKDOYV7R30Wzo
X-Gm-Gg: ASbGncuACIKj+EHn2iHD9Aui6i+uIslErav80NgPRJeUOaBfavP4MsTtJ8/rR9GyoLf
	h28INhbe+wR/GTRnfmawvvWm/dq1ZlVaQ1fjpdf41wvRjdSTFHoQb6v0I7R7AmLnp+sIenWDNuT
	r1MRwyHduNbNbL+NfEuzFJ7yeilyloxk8TWZEWcpp36OXPGzhK4kc+qFtfky5ux11iAJGdaaWXB
	WJtqncg6sUv84CGnZGpqLKdwfOb5xViOtRDkW4cpoQcsS/u6LxplwA7vv+THhFWBrRqrTsDhjMA
	DF2ljKuKc945a5vZg+ENdUMPSG/J7IQdi2DdN6TFPl/HmucNlPO4tyoRW0v5Yx6oI0RwusuQuWa
	yoNqp
X-Google-Smtp-Source: AGHT+IEY4hJ4+y0MnSwcin/X5yMbfMX2rlPGrxXj2stWp9C4NMGoZplIcoPGEYKHHfJxM+PTRJ4GqA==
X-Received: by 2002:a05:690c:3686:b0:6f9:ad48:a3c7 with SMTP id 00721157ae682-6fd4a0acc71mr190341807b3.21.1741014942895;
        Mon, 03 Mar 2025 07:15:42 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6fd6b9619c5sm9708167b3.75.2025.03.03.07.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:15:42 -0800 (PST)
Date: Mon, 3 Mar 2025 10:15:41 -0500
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
Message-ID: <Z8XHnToOV03hiQKu@thinkpad>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>

On Mon, Mar 03, 2025 at 01:29:19AM +0800, Kuan-Wei Chiu wrote:
> Hi Yury,
> 
> On Sun, Mar 02, 2025 at 11:02:12AM -0500, Yury Norov wrote:
> > On Sun, Mar 02, 2025 at 04:20:02PM +0800, Kuan-Wei Chiu wrote:
> > > Hi Yury,
> > > 
> > > On Sat, Mar 01, 2025 at 10:10:20PM -0500, Yury Norov wrote:
> > > > On Sat, Mar 01, 2025 at 10:23:52PM +0800, Kuan-Wei Chiu wrote:
> > > > > Add generic C implementations of __paritysi2(), __paritydi2(), and
> > > > > __parityti2() as fallback functions in lib/parity.c. These functions
> > > > > compute the parity of a given integer using a bitwise approach and are
> > > > > marked with __weak, allowing architecture-specific implementations to
> > > > > override them.
> > > > > 
> > > > > This patch serves as preparation for using __builtin_parity() by
> > > > > ensuring a fallback mechanism is available when the compiler does not
> > > > > inline the __builtin_parity().
> > > > > 
> > > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > > ---
> > > > >  lib/Makefile |  2 +-
> > > > >  lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> > > > >  2 files changed, 49 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 lib/parity.c
> > > > > 
> > > > > diff --git a/lib/Makefile b/lib/Makefile
> > > > > index 7bab71e59019..45affad85ee4 100644
> > > > > --- a/lib/Makefile
> > > > > +++ b/lib/Makefile
> > > > > @@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
> > > > >  	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
> > > > >  	 percpu-refcount.o rhashtable.o base64.o \
> > > > >  	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
> > > > > -	 generic-radix-tree.o bitmap-str.o
> > > > > +	 generic-radix-tree.o bitmap-str.o parity.o
> > > > >  obj-y += string_helpers.o
> > > > >  obj-y += hexdump.o
> > > > >  obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
> > > > > diff --git a/lib/parity.c b/lib/parity.c
> > > > > new file mode 100644
> > > > > index 000000000000..a83ff8d96778
> > > > > --- /dev/null
> > > > > +++ b/lib/parity.c
> > > > > @@ -0,0 +1,48 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > +/*
> > > > > + * lib/parity.c
> > > > > + *
> > > > > + * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > > + * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > + *
> > > > > + * __parity[sdt]i2 can be overridden by linking arch-specific versions.
> > > > > + */
> > > > > +
> > > > > +#include <linux/export.h>
> > > > > +#include <linux/kernel.h>
> > > > > +
> > > > > +/*
> > > > > + * One explanation of this algorithm:
> > > > > + * https://funloop.org/codex/problem/parity/README.html
> > > > 
> > > > I already asked you not to spread this link. Is there any reason to
> > > > ignore it?
> > > > 
> > > In v2, this algorithm was removed from bitops.h, so I moved the link
> > > here instead. I'm sorry if it seemed like I ignored your comment.
> > 
> > Yes, it is.
> >  
> > > In v1, I used the same approach as parity8() because I couldn't justify
> > > the performance impact in a specific driver or subsystem. However,
> > > multiple people commented on using __builtin_parity or an x86 assembly
> > > implementation. I'm not ignoring their feedback-I want to address these
> > 
> > Please ask those multiple people: are they ready to maintain all that
> > zoo of macros, weak implementations, arch implementations and stubs
> > for no clear benefit? Performance is always worth it, but again I see
> > not even a hint that the drivers care about performance. You don't
> > measure it, so don't care as well. Right?
> > 
> > > comments. Before submitting, I sent an email explaining my current
> > > approach: using David's suggested method along with __builtin_parity,
> > > but no one responded. So, I decided to submit v2 for discussion
> > > instead.
> > 
> > For discussion use tag RFC.
> > 
> > > 
> > > To avoid mistakes in v3, I want to confirm the following changes before
> > > sending it:
> > > 
> > > (a) Change the return type from int to bool.
> > > (b) Avoid __builtin_parity and use the same approach as parity8().
> > > (c) Implement parity16/32/64() as single-line inline functions that
> > >     call the next smaller variant after xor.
> > > (d) Add a parity() macro that selects the appropriate parityXX() based
> > >     on type size.
> > > (e) Update users to use this parity() macro.
> > > 
> > > However, (d) may require a patch affecting multiple subsystems at once
> > > since some places that already include bitops.h have functions named
> > > parity(), causing conflicts. Unless we decide not to add this macro in
> > > the end.
> > > 
> > > As for checkpatch.pl warnings, they are mostly pre-existing coding
> > > style issues in this series. I've kept them as-is, but if preferred,
> > > I'm fine with fixing them.
> > 
> > Checkpatch only complains on new lines. Particularly this patch should
> > trigger checkpatch warning because it adds a new file but doesn't touch
> > MAINTAINERS. 
> > 
> For example, the following warning:
> 
> ERROR: space required after that ',' (ctx:VxV)
> #84: FILE: drivers/input/joystick/sidewinder.c:368:
> +                       if (!parity64(GB(0,33)))
>                                           ^
> 
> This issue already existed before this series, and I'm keeping its
> style unchanged for now.
> 
> > > If anything is incorrect or if there are concerns, please let me know.
> > > 
> > > Regards,
> > > Kuan-Wei
> > > 
> > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > > index c1cb53cf2f0f..47b7eca8d3b7 100644
> > > --- a/include/linux/bitops.h
> > > +++ b/include/linux/bitops.h
> > > @@ -260,6 +260,43 @@ static inline int parity8(u8 val)
> > >  	return (0x6996 >> (val & 0xf)) & 1;
> > >  }
> > > 
> > > +static inline bool parity16(u16 val)
> > > +{
> > > +	return parity8(val ^ (val >> 8));
> > > +}
> > > +
> > > +static inline bool parity32(u32 val)
> > > +{
> > > +	return parity16(val ^ (val >> 16));
> > > +}
> > > +
> > > +static inline bool parity64(u64 val)
> > > +{
> > > +	return parity32(val ^ (val >> 32));
> > > +}
> > 
> > That was discussed between Jiri and me in v2. Fixed types functions
> > are needed only in a few very specific cases. With the exception of
> > I3C driver (which doesn't look good for both Jiri and me), all the
> > drivers have the type of variable passed to the parityXX() matching 
> > the actual variable length. It means that fixed-type versions of the
> > parity() are simply not needed. So if we don't need them, please don't
> > introduce it.
> >
> So, I should add the following parity() macro in v3, remove parity8(),
> and update all current parity8() users to use this macro, right?

If you go with macro, please apply my patch and modify it in-place
with this __auto_type thing and GCC hack. Feel free to add your
co-developed-by, or tested, or whatever.

> I changed u64 to __auto_type and applied David's suggestion to replace
> the >> 32 with >> 16 >> 16 to avoid compiler warnings.
> 
> Regards,
> Kuan-Wei
> 
> #define parity(val)					\
> ({							\
> 	__auto_type __v = (val);			\
> 	bool __ret;					\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
> 		__v ^= __v >> 16 >> 16;			\
> 		fallthrough;				\

This hack should be GCC-only, and well documented.
For clang it should be 
 		__v ^= __v >> 32;			\

> 	case 32:					\
> 		__v ^= __v >> 16;			\
> 		fallthrough;				\
> 	case 16:					\
> 		__v ^= __v >> 8;			\
> 		fallthrough;				\
> 	case 8:						\
> 		__v ^= __v >> 4;			\
> 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> 		break;					\
> 	default:					\
> 		BUILD_BUG();				\
> 	}						\
> 	__ret;						\
> })
