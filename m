Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24AD183CB0
	for <brcm80211@lists.linux.dev>; Fri,  7 Mar 2025 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741375813; cv=none; b=sHsEYEoytr0y1oRmWHO9uJN05gKIZmOIF0KwjVIlLzzROgsBKx977Ht6Zrlo1CezaRVc0ZKdfSQwq08XUDJXBbK+IcaL5M8qsoq4TzIsjdps04D1zz9a6t8gi6zTbpEFgKcVcQBzumENCLf3Yhv6PrUnfxCXRZYtH+vC+aEUehw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741375813; c=relaxed/simple;
	bh=ES8fce8TYJh0CUhG3aOJvKwa0LbilzpFk3jZFOZFALk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJSXmsZFgSJhKGxw7rSoS35pZtYdjs+TWyguzsokybCmtRj5C2YGaBlejMCoNqSSPbaRCPE3y9PrPTtd8SU7h3z6CKmnqWbVi5fYsiJjU6PVSCu4CFY0Dl+1/CPsHKHtmwz9rDgwKy8efrNBKVXyVmJiXCKPh7juPlrHd5T6B9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXMbNXdi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXMbNXdi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22401f4d35aso43596985ad.2
        for <brcm80211@lists.linux.dev>; Fri, 07 Mar 2025 11:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741375811; x=1741980611; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ujnt93n2ZnNyLSMeIXg1bvl3lYCF/JQ06NeoxLK/MdQ=;
        b=IXMbNXdiT/6oo8EKQhSybREQ+1nnlS6IOhnbN0L3A1FnvxvrW1ejKMrD5XHAVumrAY
         Ax41L/jc6E97LhONzvmrsw2zsNr71RN8qZtMarBMA8zBTE1qSgOuZ+7CrIJPE9ej31Ta
         fZj63AqkUuwxRw5olqUzgu7HTm1xoWueKN8oApsDbZTs6zMXI6qwVjFEoigUUCWCkQBt
         vRYc+CSchSuDk5g+Ep4334i+oFgAMD/wqvbddr85kmNT9MdHopyiL4FHUQcAoin0X9o5
         pEgX4hM03IOYLIHfzM9KiLvlzRADggDz7ptbeBND7nJH5NRuG3Q3KgYOAfjdJPNdwB3L
         19Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741375811; x=1741980611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ujnt93n2ZnNyLSMeIXg1bvl3lYCF/JQ06NeoxLK/MdQ=;
        b=pOh97i4wqoKiK8SJRLMm0jdwpe82k6iBNAyz+vNyv03xdMU1elt8bGoj3vt/RG5sAO
         Vgsm7IxtxlYlMNBB2SHS2j1mQBSG9lmP1zBw9nnKVvfCb062LbwddRpzskPBSexhGJYX
         XdNQuBgYVP15ngk/Ih7mMQI3d3r3FwFz0m6SffePo9krtZ8q6CGnThU4cer/Djk3GTur
         r/J5uJq3wItpLYIP4dDNT+MX5S5PHXxq1c9KJUEbm4O6LlXekuhjlUAjfOFqP+l8teqn
         NAHib7uzV0UgN+bh4tVgde13BewBhr4UCHN/FOq3lQHR5dK/qhh8mgP/EVc3DHkNUkO0
         jm/g==
X-Forwarded-Encrypted: i=1; AJvYcCWHlGRgEZRqwFneBJKmtQUsahls9QnCfc8hKpp4pzXhoEsGSGf7WkzihxGZIwfOWZb28NnQtNX8aMc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+vwWFXgckBScAl/buVOxbL58RoHkCNuf3y2XJEnAE5CTUQskG
	2FCDKZn5jZoPzuXKlNxxy6ihHka7FLJXkhpvuuk/XAg8iUYojouk
X-Gm-Gg: ASbGncu3TqdBQRemrletxUQCSv5jzDOC1RQo3Iy3wCqdBNMVNhKAakaxcIKJo5uevU0
	QcdcQnG8T/LN0MZd6e0LIvUnEo/y+ReL6f2tjLTCRMr9lZ6E4+npV6U16rgQDlH1f41sAAmsZWx
	7W7ywdnh+jry7Eji/GoZhLC2Uc04aRy1Pr5GB9yTZcri6P1lV0KTwdtwiAaNEPHSimlX9rLK3LJ
	n5f/LGeQGAGLYQQRlz1QiJ2puU3DJf1k6pKsTBwvdiJE515zhVSfpHaZHvvbx5LFpPktyFr/G/W
	U5+EKhQk6I8BD/aTBxFjmZ5VEW6EFMy4Xj8zMcmxgI3k
X-Google-Smtp-Source: AGHT+IEmnovg8SODODeYbL7InF2WSqC9McWE/UoY4IWxbTzIc1jrQMfyhDSc++tBv5NrR3IGNpr8rQ==
X-Received: by 2002:a17:902:f645:b0:21f:4c8b:c4de with SMTP id d9443c01a7336-22428ac90a6mr73028235ad.42.1741375810720;
        Fri, 07 Mar 2025 11:30:10 -0800 (PST)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddffesm34081415ad.40.2025.03.07.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 11:30:10 -0800 (PST)
Date: Fri, 7 Mar 2025 14:30:08 -0500
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
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
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <Z8tJNt83uVBca0cj@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <Z8ri5h-nvNXNp6NB@gmail.com>
 <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>

On Fri, Mar 07, 2025 at 04:14:34AM -0800, H. Peter Anvin wrote:
> On March 7, 2025 4:13:26 AM PST, Ingo Molnar <mingo@kernel.org> wrote:
> >
> >* Jiri Slaby <jirislaby@kernel.org> wrote:
> >
> >> On 07. 03. 25, 12:38, Ingo Molnar wrote:
> >> > 
> >> > * Jiri Slaby <jirislaby@kernel.org> wrote:
> >> > 
> >> > > On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> >> > > > Change return type to bool for better clarity. Update the kernel doc
> >> > > > comment accordingly, including fixing "@value" to "@val" and adjusting
> >> > > > examples. Also mark the function with __attribute_const__ to allow
> >> > > > potential compiler optimizations.
> >> > > > 
> >> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> >> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> >> > > > ---
> >> > > >    include/linux/bitops.h | 10 +++++-----
> >> > > >    1 file changed, 5 insertions(+), 5 deletions(-)
> >> > > > 
> >> > > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> >> > > > index c1cb53cf2f0f..44e5765b8bec 100644
> >> > > > --- a/include/linux/bitops.h
> >> > > > +++ b/include/linux/bitops.h
> >> > > > @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
> >> > > >    /**
> >> > > >     * parity8 - get the parity of an u8 value
> >> > > > - * @value: the value to be examined
> >> > > > + * @val: the value to be examined
> >> > > >     *
> >> > > >     * Determine the parity of the u8 argument.
> >> > > >     *
> >> > > >     * Returns:
> >> > > > - * 0 for even parity, 1 for odd parity
> >> > > > + * false for even parity, true for odd parity
> >> > > 
> >> > > This occurs somehow inverted to me. When something is in parity means that
> >> > > it has equal number of 1s and 0s. I.e. return true for even distribution.
> >> > > Dunno what others think? Or perhaps this should be dubbed odd_parity() when
> >> > > bool is returned? Then you'd return true for odd.
> >> > 
> >> > OTOH:
> >> > 
> >> >   - '0' is an even number and is returned for even parity,
> >> >   - '1' is an odd  number and is returned for odd  parity.
> >> 
> >> Yes, that used to make sense for me. For bool/true/false, it no longer does.
> >> But as I wrote, it might be only me...
> >
> >No strong opinion on this from me either, I'd guess existing practice 
> >with other parity functions should probably control. (If a coherent 
> >praxis exists.).
> >
> >Thanks,
> >
> >	Ingo
> 
> Instead of "bool" think of it as "bit" and it makes more sense

So, to help people thinking that way we can introduce a corresponding
type:
        typedef unsigned _BitInt(1) u1;

It already works for clang, and GCC is going to adopt it with std=c23.
We can make u1 an alias to bool for GCC for a while. If you guys like
it, I can send a patch.

For clang it prints quite a nice overflow warning:

tst.c:59:9: warning: implicit conversion from 'int' to 'u1' (aka 'unsigned _BitInt(1)') changes value from 2 to 0 [-Wconstant-conversion]
   59 |         u1 r = 2;
      |            ~   ^

Thanks,
Yury
