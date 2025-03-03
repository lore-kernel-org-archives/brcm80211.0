Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C611A270
	for <brcm80211@lists.linux.dev>; Mon,  3 Mar 2025 02:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740970053; cv=none; b=oudq8pV7vw8U6x3OzfuL3ciUOQwmRDh6K9nKDK2dE35HeiuShKx2JT8efXbd9NCch+n1Q+y2UQlhCZ5GWCEUOoJWmRnpura6dJ5tl3rY1+zME0Qp+80RkoGUUlMFg+Vrz/lUgfK+yKBu8YBBG685sm6dhsI7b6v79JwSMtH5QeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740970053; c=relaxed/simple;
	bh=pNFlzvLr3KiOS4uSJIEzxgq2L6/EJ3NXDTQ131OQuYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSi30vLkaYD41R0/CohnkZpvBLzm6IjFkjMNIrQ0JnABHO4Jg649XZQCn9GVsiNbv1ECcbCJlPSPCS5kf8V6GQje6MTcyatT/G3si/IbxF5rv9a4I8xfPRl6wObiwXxnJ8xewRRVntJSR+rTUcdBypEjxC9EhrXCdX48NnUwl9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfhSDy4c; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfhSDy4c"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2239f8646f6so14504355ad.2
        for <brcm80211@lists.linux.dev>; Sun, 02 Mar 2025 18:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740970050; x=1741574850; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/sZXPafCnfjPrX+eEhFZ+/W9i9aWnu/LtnJisycSy4=;
        b=AfhSDy4cM1NMOqfHr8ET8Zah5ATKrMvK0wTM9nMkUndDnLl8jsj/74leWtqqymAQgm
         31UOSsHhRpmv08AMblasekT2ZYgCinUIeneMv3mVAbNK940yEJaygodqWITQ/I14A4MW
         vwgHA+EL3xAQys1vlwMhuCsNepGxqmA4buBGySJTcFGFuC6hK6AvVvDwWpw9q+eHaWU/
         0kaoiEHPoklC8KQmZ3aNAOcPkdjNVRJI6X3uxhkx2rUqRbK11sgigH5XDOitb0k6lXxU
         WPgwASXycU/NBPIj83ACTtWh9PVQ49fLHHYPm3IZB/dcuujiXAqINn1RQ9+efyZu99g0
         qYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740970050; x=1741574850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/sZXPafCnfjPrX+eEhFZ+/W9i9aWnu/LtnJisycSy4=;
        b=tu7Chq79j6FHXtqOu8UvLjEXzkQJZBFYG6UIXzUHuLiB8xbdZ5rh33+UoukWbI7BBR
         ZvSDe22Yq7u51UX2ssWgm8BwsCSZd8hUDHC5V5koKYk1THe17iCy7V3cMXkBYz0TZkbT
         yPR7+Fde0CWoCkMHEJt68oIV2+ZuXC0m0Kka3kdruLeRLXrOsYO8pM2yoGJ71Dr1isAj
         PPjw5wriJ+ro9fDKvDtoMa0heKt/7EHQOE2cNhSwz51oAVgBerewIg1K5OFpeO2757dC
         o4YEzvAI39yAaF8wFVve0MEePuyGbjIi6RV/ixrCPtwwN6Ew+WmNpJqtNRdN/s4tz3JL
         6rVA==
X-Forwarded-Encrypted: i=1; AJvYcCXGNsPFwV/gfI7VVZgPAcTVk3mZMFgUTNyzV3x3Uda38O/qIe7ymOXi3XtzzYplbBhoL9knUg5yi6w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzS5vXSF1nM9tbWJc+WYJap6nNjiLFqdNFGvx02MTlneHLNs4oB
	218AygVhX82+esa2Xv2KUNTfSXygKTpaHdLzZ67eqGYxcuPx6PPL
X-Gm-Gg: ASbGncs/wpzrgTq2QNsGq2f+DI4mlOc/1n08UcIZcbC6hABTEXu8abfscSHbh4eoX7Y
	P3wzlVTenFl9JpyMQrczKUUnNTR6f2ibgy9yK0TWZLXbr+KsABcH/+/yjpuZi4oZUIZs4lwFkIx
	VwkDAQX1eqr1cLQkBprvZaYpnK2BYkTnoEg/QB7+98efPaNQd/H5cRGpP006ShT7UXmOTyIJvL3
	A1weUbkt1c3Oxi2w/zi2dZv8ZkaK5etTHDHqmosig7/l/AgwaIA6d3JbON9Az6YWLZuSlk4JyHk
	/dSBneqShf4EefMTkNwuo92lg1I/oGmglG+vPyZuX/iz7EZR/z3lWk3kvd160uWk+GUGkrBS
X-Google-Smtp-Source: AGHT+IEaGtdMZBEy2bxwSPGd2bD8qrXnPe8PVMJ2bjqQlITrRKiZTP6g3iWQ0ddz5yh+ocZy4OpOpA==
X-Received: by 2002:a17:903:2302:b0:216:2bd7:1c2f with SMTP id d9443c01a7336-22368f7b5d3mr144431425ad.18.1740970050255;
        Sun, 02 Mar 2025 18:47:30 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00255d8sm7660595b3a.88.2025.03.02.18.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 18:47:29 -0800 (PST)
Date: Mon, 3 Mar 2025 10:47:20 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
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
	andrew.cooper3@citrix.com, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback
 implementations
Message-ID: <Z8UYOD2tyjS25gIc@visitorckw-System-Product-Name>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
 <20250301142409.2513835-2-visitorckw@gmail.com>
 <Z8PMHLYHOkCZJpOh@thinkpad>
 <Z8QUsgpCB0m2qKJR@visitorckw-System-Product-Name>
 <Z8SBBM_81wyHfvC0@thinkpad>
 <Z8SVb4xD4tTiMEpL@visitorckw-System-Product-Name>
 <20250302190954.2d7e068f@pumpkin>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250302190954.2d7e068f@pumpkin>

On Sun, Mar 02, 2025 at 07:09:54PM +0000, David Laight wrote:
> On Mon, 3 Mar 2025 01:29:19 +0800
> Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> 
> > Hi Yury,
> > 
> > On Sun, Mar 02, 2025 at 11:02:12AM -0500, Yury Norov wrote:
> > > On Sun, Mar 02, 2025 at 04:20:02PM +0800, Kuan-Wei Chiu wrote:  
> > > > Hi Yury,
> > > > 
> > > > On Sat, Mar 01, 2025 at 10:10:20PM -0500, Yury Norov wrote:  
> > > > > On Sat, Mar 01, 2025 at 10:23:52PM +0800, Kuan-Wei Chiu wrote:  
> > > > > > Add generic C implementations of __paritysi2(), __paritydi2(), and
> > > > > > __parityti2() as fallback functions in lib/parity.c. These functions
> > > > > > compute the parity of a given integer using a bitwise approach and are
> > > > > > marked with __weak, allowing architecture-specific implementations to
> > > > > > override them.
> > > > > > 
> > > > > > This patch serves as preparation for using __builtin_parity() by
> > > > > > ensuring a fallback mechanism is available when the compiler does not
> > > > > > inline the __builtin_parity().
> > > > > > 
> > > > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > > > ---
> > > > > >  lib/Makefile |  2 +-
> > > > > >  lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > >  2 files changed, 49 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644 lib/parity.c
> > > > > > 
> > > > > > diff --git a/lib/Makefile b/lib/Makefile
> > > > > > index 7bab71e59019..45affad85ee4 100644
> > > > > > --- a/lib/Makefile
> > > > > > +++ b/lib/Makefile
> > > > > > @@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
> > > > > >  	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
> > > > > >  	 percpu-refcount.o rhashtable.o base64.o \
> > > > > >  	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
> > > > > > -	 generic-radix-tree.o bitmap-str.o
> > > > > > +	 generic-radix-tree.o bitmap-str.o parity.o
> > > > > >  obj-y += string_helpers.o
> > > > > >  obj-y += hexdump.o
> > > > > >  obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
> > > > > > diff --git a/lib/parity.c b/lib/parity.c
> > > > > > new file mode 100644
> > > > > > index 000000000000..a83ff8d96778
> > > > > > --- /dev/null
> > > > > > +++ b/lib/parity.c
> > > > > > @@ -0,0 +1,48 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > > > +/*
> > > > > > + * lib/parity.c
> > > > > > + *
> > > > > > + * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > > > + * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
> > > > > > + *
> > > > > > + * __parity[sdt]i2 can be overridden by linking arch-specific versions.
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/export.h>
> > > > > > +#include <linux/kernel.h>
> > > > > > +
> > > > > > +/*
> > > > > > + * One explanation of this algorithm:
> > > > > > + * https://funloop.org/codex/problem/parity/README.html  
> > > > > 
> > > > > I already asked you not to spread this link. Is there any reason to
> > > > > ignore it?
> > > > >   
> > > > In v2, this algorithm was removed from bitops.h, so I moved the link
> > > > here instead. I'm sorry if it seemed like I ignored your comment.  
> > > 
> > > Yes, it is.
> > >    
> > > > In v1, I used the same approach as parity8() because I couldn't justify
> > > > the performance impact in a specific driver or subsystem. However,
> > > > multiple people commented on using __builtin_parity or an x86 assembly
> > > > implementation. I'm not ignoring their feedback-I want to address these  
> > > 
> > > Please ask those multiple people: are they ready to maintain all that
> > > zoo of macros, weak implementations, arch implementations and stubs
> > > for no clear benefit? Performance is always worth it, but again I see
> > > not even a hint that the drivers care about performance. You don't
> > > measure it, so don't care as well. Right?
> > >   
> > > > comments. Before submitting, I sent an email explaining my current
> > > > approach: using David's suggested method along with __builtin_parity,
> > > > but no one responded. So, I decided to submit v2 for discussion
> > > > instead.  
> > > 
> > > For discussion use tag RFC.
> > >   
> > > > 
> > > > To avoid mistakes in v3, I want to confirm the following changes before
> > > > sending it:
> > > > 
> > > > (a) Change the return type from int to bool.
> > > > (b) Avoid __builtin_parity and use the same approach as parity8().
> > > > (c) Implement parity16/32/64() as single-line inline functions that
> > > >     call the next smaller variant after xor.
> > > > (d) Add a parity() macro that selects the appropriate parityXX() based
> > > >     on type size.
> > > > (e) Update users to use this parity() macro.
> > > > 
> > > > However, (d) may require a patch affecting multiple subsystems at once
> > > > since some places that already include bitops.h have functions named
> > > > parity(), causing conflicts. Unless we decide not to add this macro in
> > > > the end.
> > > > 
> > > > As for checkpatch.pl warnings, they are mostly pre-existing coding
> > > > style issues in this series. I've kept them as-is, but if preferred,
> > > > I'm fine with fixing them.  
> > > 
> > > Checkpatch only complains on new lines. Particularly this patch should
> > > trigger checkpatch warning because it adds a new file but doesn't touch
> > > MAINTAINERS. 
> > >   
> > For example, the following warning:
> > 
> > ERROR: space required after that ',' (ctx:VxV)
> > #84: FILE: drivers/input/joystick/sidewinder.c:368:
> > +                       if (!parity64(GB(0,33)))
> >                                           ^
> > 
> > This issue already existed before this series, and I'm keeping its
> > style unchanged for now.
> > 
> > > > If anything is incorrect or if there are concerns, please let me know.
> > > > 
> > > > Regards,
> > > > Kuan-Wei
> > > > 
> > > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > > > index c1cb53cf2f0f..47b7eca8d3b7 100644
> > > > --- a/include/linux/bitops.h
> > > > +++ b/include/linux/bitops.h
> > > > @@ -260,6 +260,43 @@ static inline int parity8(u8 val)
> > > >  	return (0x6996 >> (val & 0xf)) & 1;
> > > >  }
> > > > 
> > > > +static inline bool parity16(u16 val)
> > > > +{
> > > > +	return parity8(val ^ (val >> 8));
> > > > +}
> > > > +
> > > > +static inline bool parity32(u32 val)
> > > > +{
> > > > +	return parity16(val ^ (val >> 16));
> > > > +}
> > > > +
> > > > +static inline bool parity64(u64 val)
> > > > +{
> > > > +	return parity32(val ^ (val >> 32));
> > > > +}  
> > > 
> > > That was discussed between Jiri and me in v2. Fixed types functions
> > > are needed only in a few very specific cases. With the exception of
> > > I3C driver (which doesn't look good for both Jiri and me), all the
> > > drivers have the type of variable passed to the parityXX() matching 
> > > the actual variable length. It means that fixed-type versions of the
> > > parity() are simply not needed. So if we don't need them, please don't
> > > introduce it.
> > >  
> > So, I should add the following parity() macro in v3, remove parity8(),
> > and update all current parity8() users to use this macro, right?
> > 
> > I changed u64 to __auto_type and applied David's suggestion to replace
> > the >> 32 with >> 16 >> 16 to avoid compiler warnings.
> > 
> > Regards,
> > Kuan-Wei
> > 
> > #define parity(val)					\
> > ({							\
> > 	__auto_type __v = (val);			\
> > 	bool __ret;					\
> > 	switch (BITS_PER_TYPE(val)) {			\
> > 	case 64:					\
> > 		__v ^= __v >> 16 >> 16;			\
> > 		fallthrough;				\
> > 	case 32:					\
> > 		__v ^= __v >> 16;			\
> > 		fallthrough;				\
> > 	case 16:					\
> > 		__v ^= __v >> 8;			\
> > 		fallthrough;				\
> > 	case 8:						\
> > 		__v ^= __v >> 4;			\
> > 		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > 		break;					\
> > 	default:					\
> > 		BUILD_BUG();				\
> > 	}						\
> > 	__ret;						\
> > })
> 
> I'm seeing double-register shifts for 64bit values on 32bit systems.
> And gcc is doing 64bit double-register maths all the way down.
> 
> That is fixed by changing the top of the define to
> #define parity(val)					\
> ({							\
> 	unsigned int __v = (val);			\
> 	bool __ret;					\
> 	switch (BITS_PER_TYPE(val)) {			\
> 	case 64:					\
> 		__v ^= val >> 16 >> 16;			\
> 		fallthrough;				\
> 
> But it's need changing to only expand 'val' once.
> Perhaps:
> 	auto_type _val = (val);
> 	u32 __ret = val;
> and (mostly) s/__v/__ret/g
>
I'm happy to make this change, though I'm a bit confused about how much
we care about the code generated by gcc. So this is the macro expected
in v3:

#define parity(val)					\
({							\
	__auto_type __v = (val);			\
	u32 __ret = val;				\
	switch (BITS_PER_TYPE(val)) {			\
	case 64:					\
                __ret ^= __v >> 16 >> 16;		\
		fallthrough;				\
	case 32:					\
		__ret ^= __ret >> 16;			\
		fallthrough;				\
	case 16:					\
		__ret ^= __ret >> 8;			\
		fallthrough;				\
	case 8:						\
		__ret ^= __ret >> 4;			\
		__ret = (0x6996 >> (__ret & 0xf)) & 1;	\
		break;					\
	default:					\
		BUILD_BUG();				\
	}						\
	__ret;						\
})
