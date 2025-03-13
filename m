Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E4BAD5E
	for <brcm80211@lists.linux.dev>; Thu, 13 Mar 2025 16:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741883196; cv=none; b=SWXUGZh4rS1gFATBceBUrgicilZR8G/TjKlBJRmm1GjaZ8qQ7rCYb8dbrDhPgGpE2y9eSWY6gt2ZUW6rh4sWDvuBkwsGUqvsi2yqwOAzUlWReGgvVhuC/skMpOksl8ownY1p1v52QE/gkyo3Xj8RzSIcY/v/PcQ0EIjsq9csf8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741883196; c=relaxed/simple;
	bh=QtQeFXXUyqLXG+oE2hxpLfZohC2eCqSYFWR9RbXR29s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0h9JscqjkKhgLsggA/EhNdMYDZAGoO/K6MGTyo6fX4z96OBkK+7tT2ruOKOuiiGHpPrnUjkyCrYWL7zY6d3T5tVkCFDMA1YPcrhnRnlxYX5yJd6FxuzOj5UjTV3Q8OfWpULDMZXGFX+Qr63uOcToZ1Xe4OOaJnZEfMlrB+g6qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbjAtxgA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbjAtxgA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so2082198a91.1
        for <brcm80211@lists.linux.dev>; Thu, 13 Mar 2025 09:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741883194; x=1742487994; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Dj58qb5Fdu7jAiSs8njputJgR05+QajXZnrH30MR1c=;
        b=XbjAtxgAr0XHKnaePLt5KOOD1tI917t+UycJt+TfmbchiqMRo0lNH7ST+PN75QxZPB
         Xy9YLiEQy67R9UHSqNUYteYnZwVihai+B4HF8kRubX/PLcGRhSYtycFc+RGqrmDKSFxN
         fEQDRPjvUHNsWrnV1OsP72AvWCXkviW6OlOEEA8P1rHco9/WwdeAJkK55ydZ5UK39ihb
         k9gY0UF+6g32nqC8wtsh+P9+yhBfS50l3rCgrx2J2pzASJZfrwAXglbN+bgTZNt7X9Xm
         7cxTXYRIMfMbKgXGMKn6nJKaUbKVb9E6b602NNyFVYDvgVC8gQ4HlcYwJGAhz80JDUmv
         stPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883194; x=1742487994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Dj58qb5Fdu7jAiSs8njputJgR05+QajXZnrH30MR1c=;
        b=MnfHIW3M9bbMus6H4OVm9EzDNv6fJMVedkQatoRPxhEQR8qb9ALaHb/FccHmtEeEf3
         +znx+MsaQ0WOsd6cOlTN1fEsaVfVPOTbylcXJavJxhhoPc+dip57VH1gvyT31cV+n6fm
         BGWh4zwrvVtZ5am54XSPS2QMMFPZZdWtWXGLzSbxNZly+9fANyFRZLTIlJKNesmoDGqY
         HS+esDt5tTqqneYIrZDHQKKp4GtFYBXThr/1qiHDafd1KnIX4zy3IQh6HIMSzE+xFJ7w
         s2m8PMHr3de8sm1YtJYGPIc2F++sdKzB0lWELd+4syOQk+mzbe8raBXZW8ftSYEGNUSE
         iLAA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5P6nywZ79e1T/iwoHjLeDQnW+IjwTWt69ZxXUeaHnjJ0L3++SO5bLT1au87z1/jZQyA7Ra7GdgE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoQniY8Bthmgx9fdpWFXkWLTslnbCzfV01azuYZwb4Eo7Ka1G7
	NZ9gB4ril6LKcLhr0k/MFr4CEyeCAKVeHRRUvhZIo9YGb5qlkBh8
X-Gm-Gg: ASbGncvhqDIP65hQW/HTF971QvEhEjtH6wWPCZaDwMgbGdPvNmdm2tPsiFgcQZIoVV/
	wn/kgi7b5drkbgOqdWcg4klhTkFyaR7TUjcuFg1NCzc2aC+qXnb+86ZeSVbto6cMfsQIVgSI/dy
	lUd1IG6xBoEvNvjaect0r22m4Z/vQYaY8iBvqfM0AqPsUQQWHXmIaw941TAra9hNHrJFi4/kLNF
	CmKsDF+rJKYQ6o8gzhEd3bm9kmLQ7yLZLsnvih9pwLEuULo1cERtszV64XAyDIVrmZS7v191eWK
	j5piLdv8dQ+cS0rIZnkdniWIxYCrJOiHGnehH0JhelZo
X-Google-Smtp-Source: AGHT+IGQ1B1r23bHH1y7f1P01LiOEnbRiq9HK7MEAu/5nbXG5vCyYer48OQlR5RqnwzzsBUWrNiOAw==
X-Received: by 2002:a17:90b:3906:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-300ff0d6160mr17644409a91.14.1741883194498;
        Thu, 13 Mar 2025 09:26:34 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6888a02sm15453765ad.40.2025.03.13.09.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:26:33 -0700 (PDT)
Date: Thu, 13 Mar 2025 12:26:32 -0400
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
Message-ID: <Z9MHOOfnHnLsnhxu@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <Z8ri5h-nvNXNp6NB@gmail.com>
 <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>
 <Z8tJNt83uVBca0cj@thinkpad>
 <783456A8-67F9-47DD-AB15-914622A921CD@zytor.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <783456A8-67F9-47DD-AB15-914622A921CD@zytor.com>

On Fri, Mar 07, 2025 at 11:33:40AM -0800, H. Peter Anvin wrote:
> On March 7, 2025 11:30:08 AM PST, Yury Norov <yury.norov@gmail.com> wrote:

[...]

> >> Instead of "bool" think of it as "bit" and it makes more sense
> >
> >So, to help people thinking that way we can introduce a corresponding
> >type:
> >        typedef unsigned _BitInt(1) u1;
> >
> >It already works for clang, and GCC is going to adopt it with std=c23.
> >We can make u1 an alias to bool for GCC for a while. If you guys like
> >it, I can send a patch.
> >
> >For clang it prints quite a nice overflow warning:
> >
> >tst.c:59:9: warning: implicit conversion from 'int' to 'u1' (aka 'unsigned _BitInt(1)') changes value from 2 to 0 [-Wconstant-conversion]
> >   59 |         u1 r = 2;
> >      |            ~   ^
> >
> >Thanks,
> >Yury
> 
> No, for a whole bunch of reasons.

Can you please elaborate?
