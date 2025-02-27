Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A29C270EA2
	for <brcm80211@lists.linux.dev>; Thu, 27 Feb 2025 21:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740693468; cv=none; b=a/iGAfZPqllBpGjcpEySDDb/bKw3jLJvvNozkraY+Z3yWp2SEl9+klyTLmRSirEM6lk37KKNIpFVkrv/bNsGvWs3oFh2kjQ5y4M1wDhFdJ/kzOoXGaI5rzbgJ6JqwgW3SwVwxdyQ5y/wU3GFh/dmVrbPeaZbxb+V/ArTf/+jyy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740693468; c=relaxed/simple;
	bh=KRFx2VPv0/SkpIJsIryj+VgjCDlLd6MvWLHprVAY+pE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IETrppeE5j5A/vm2ID4MH8lPSC6nm+Wr5KpHGaEq5Mbz+d8J98QS511gtJzFZM13k4Xxollwh/wVyWIZh724m476nY7AVcUVqUoeQw/umJprH2kVcNQqiMGtP6iGcaG+dGTeogwUpO63W/ChWJBLXcKQfQrgBrMl5E5GRw3LztU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DA4iUl5d; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DA4iUl5d"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-439a1e8ba83so14205855e9.3
        for <brcm80211@lists.linux.dev>; Thu, 27 Feb 2025 13:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740693465; x=1741298265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMuX81k7SiNTHz2+bDlgy5RWfBuIrQmuJh6Y3XOI5k0=;
        b=DA4iUl5dmE/h3/v8qMEApMfLm7jefJnr+4G9YtqpLd/9dKmi+Fx8lX+5CkiQpefaDU
         QQbAGecTeS+tRNZ/cqrxjwMgad2Ys86m2xSUTqVbH74pjXXmATaZasxEGQS9BwlHkPVC
         scXJ6PsAuHHD7XLeHMTGBruMHpE1pf4Ti9nbSE88yQC9lkfzgNiPkDxspCv/6045PxLY
         Re7LOLMPTN7iewNVuRqjwucjUpEpzDPIvz0Rp04Ltdts2iFPrKONezOQ+ySgQS5vXqzC
         opFFAuyt2aNg8h2/ZSVS7ahwXBp3IeST7FPjnaYmgJ7GVoa0r2yBOXev6g/0nJpf3Ami
         aoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740693465; x=1741298265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMuX81k7SiNTHz2+bDlgy5RWfBuIrQmuJh6Y3XOI5k0=;
        b=X2Ld1wOmOEfIrIPZSDAHjEHX4aiF3p8k6IBWjvt1ji2O1JY15rUtBajDPeT+vOef7P
         PQ+byk4AqU7K0ZIHLlcqxq2y8KMuNaYJoAs/wSmWdxnvnalbwFfgohl5oxFAGOzguyOP
         OiEfh6Zl5zdSAXAL8/kjKv/5azJg+HdTAZbSFBSi6JUUIWbtmYTMbWopYBFlJZH+w7lO
         sJaWaRUQRJFxVutA/HBj6jHn0RO4V+u3Dc3nJZoJUrAj7nC/jj9NMVgpb4IFyLzuwdjO
         Vyhnfhqyz+BW63WW1aCGQWwOd7bMTWe3IDvpTAX6umifgYCHTQ9uKuRO+TI/DEjjU1m5
         rOZw==
X-Forwarded-Encrypted: i=1; AJvYcCUTqewzzIIeVoHbBaPZGdx/X0URwJTFCF9BPgIBiyWlySJx13foABZNN4ubuGArMls0K92LtktmvAU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzacD/12+yyhbN6huZzDnM87o55V9X0qgEK2XCBfenUKzfGtFYd
	S9xRaBdNJK7iMgVKQPHiVSCIqr4uKlJGf0s7zDsar4sXx0lcut18
X-Gm-Gg: ASbGncse8NgMB/H3gkRomUz25lhBTSCfB/UPpgb2kaADyvJ1CvDNIU97DfKhgokxcwC
	3cL4O4AdpT0UPOLuUh2ybd8Fd5h2rcZXaNXQ1yTv76UX/YJAyTDbLS2tx0mTLNmriAmYHaItrbb
	FSPN14CNj+yVIYfat2MZbdE2hXziOIJHXUC0q2xGKG5HoMUhKLOUYz3ABmohTJYGA2edWjvVtSX
	BuetL1GILmpJbL/k2jge0+aVlevGtjEUl7hpUFR1EqbGqZgMTtxgboCiartJxOmidQ4irrJ5a6P
	PWYh10rHMHNwMRQ/lGHiV+baCXOsl2g3HUwHd4QUJve/w4wUVE0lAjxBS7INDOgA
X-Google-Smtp-Source: AGHT+IEhn6JpdK4VbGGBYqWA0Kpl3+orzugSC/uMKlJ9X/pPv2vI6Oa6V51Yx+DCCez80jfd4SeOMA==
X-Received: by 2002:a05:600c:1912:b0:439:a1b8:a246 with SMTP id 5b1f17b1804b1-43ba66f9643mr7425895e9.8.1740693464406;
        Thu, 27 Feb 2025 13:57:44 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7370372dsm35525085e9.11.2025.02.27.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 13:57:43 -0800 (PST)
Date: Thu, 27 Feb 2025 21:57:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
 jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
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
Message-ID: <20250227215741.1c2e382f@pumpkin>
In-Reply-To: <Z8CpaaHv0ahHFVuK@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
	<20250223164217.2139331-3-visitorckw@gmail.com>
	<Z7zIBwH4aUA7G9MY@thinkpad>
	<20250226222911.22cb0c18@pumpkin>
	<Z8CpaaHv0ahHFVuK@thinkpad>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Feb 2025 13:05:29 -0500
Yury Norov <yury.norov@gmail.com> wrote:

> On Wed, Feb 26, 2025 at 10:29:11PM +0000, David Laight wrote:
> > On Mon, 24 Feb 2025 14:27:03 -0500
> > Yury Norov <yury.norov@gmail.com> wrote:
> > ....  
> > > +#define parity(val)					\
> > > +({							\
> > > +	u64 __v = (val);				\
> > > +	int __ret;					\
> > > +	switch (BITS_PER_TYPE(val)) {			\
> > > +	case 64:					\
> > > +		__v ^= __v >> 32;			\
> > > +		fallthrough;				\
> > > +	case 32:					\
> > > +		__v ^= __v >> 16;			\
> > > +		fallthrough;				\
> > > +	case 16:					\
> > > +		__v ^= __v >> 8;			\
> > > +		fallthrough;				\
> > > +	case 8:						\
> > > +		__v ^= __v >> 4;			\
> > > +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > +		break;					\
> > > +	default:					\
> > > +		BUILD_BUG();				\
> > > +	}						\
> > > +	__ret;						\
> > > +})
> > > +  
> > 
> > You really don't want to do that!
> > gcc makes a right hash of it for x86 (32bit).
> > See https://www.godbolt.org/z/jG8dv3cvs  
> 
> GCC fails to even understand this. Of course, the __v should be an
> __auto_type. But that way GCC fails to understand that case 64 is
> a dead code for all smaller type and throws a false-positive 
> Wshift-count-overflow. This is a known issue, unfixed for 25 years!

Just do __v ^= __v >> 16 >> 16

> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=4210
>  
> > You do better using a __v32 after the 64bit xor.  
> 
> It should be an __auto_type. I already mentioned. So because of that,
> we can either do something like this:
> 
>   #define parity(val)					\
>   ({							\
>   #ifdef CLANG                                          \
>   	__auto_type __v = (val);			\
>   #else /* GCC; because of this and that */             \
>   	u64 __v = (val);			        \
>   #endif                                                \
>   	int __ret;					\
> 
> Or simply disable Wshift-count-overflow for GCC.

For 64bit values on 32bit it is probably better to do:
int p32(unsigned long long x)
{
    unsigned int lo = x;
    lo ^= x >> 32;
    lo ^= lo >> 16;
    lo ^= lo >> 8;
    lo ^= lo >> 4;
    return (0x6996 >> (lo & 0xf)) & 1;
}
That stops the compiler doing 64bit shifts (ok on x86, but probably not elsewhere).
It is likely to be reasonably optimal for most 64bit cpu as well.
(For x86-64 it probably removes a load of REX prefix.)
(It adds an extra instruction to arm because if its barrel shifter.)


> 
> > Even the 64bit version is probably sub-optimal (both gcc and clang).
> > The whole lot ends up being a bit single register dependency chain.
> > You want to do:  
> 
> No, I don't. I want to have a sane compiler that does it for me.
> 
> > 	mov %eax, %edx
> > 	shrl $n, %eax
> > 	xor %edx, %eax
> > so that the 'mov' and 'shrl' can happen in the same clock
> > (without relying on the register-register move being optimised out).
> > 
> > I dropped in the arm64 for an example of where the magic shift of 6996
> > just adds an extra instruction.  
> 
> It's still unclear to me that this parity thing is used in hot paths.
> If that holds, it's unclear that your hand-made version is better than
> what's generated by GCC.

I wasn't seriously considering doing that optimisation.
Perhaps just hoping is might make a compiler person think :-)

	David

> 
> Do you have any perf test?
> 
> Thanks,
> Yury

