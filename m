Received: from mail-yx1-f98.google.com (mail-yx1-f98.google.com [74.125.224.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BC03806D6
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256800; cv=none; b=iQeT4lvOK8J7eJMJuD/azqQWUj6SjmHuY3/TqevH+/uLgnIBtr6J8clPLZN6LDQkaTniH7dp6V/gGFjo1zA+7zzUeR4oenQxr5ZmTX0e/BEIim/qbVZXlaQ39k88l5X2MIY5tIfaiTDa0DFpmmPR/N/2C363K25U8SlyLyXgYJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256800; c=relaxed/simple;
	bh=C/LrnnQhrRdDODaNl5ZAxVM0anW7PbqV33hp9JNvKAU=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=d7q3z+4ZIbw+c7dKz/Xol3DkuvHYWzMVeOwxNVBG7L83/ihlV9YonJBjZEziL45HqABvL2VtYLPFRH/T9YiTeZiZfVYPfvgmcNQKEWu/cpZz7EAxy2/AQJjjqzfsEQzR5en4jr7Iu9FGB7gG13ZnkOi6zuPDv7JVjxGxQ1SyAVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JWLxeJpz; arc=none smtp.client-ip=74.125.224.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JWLxeJpz"
Received: by mail-yx1-f98.google.com with SMTP id 956f58d0204a3-664e3ed58bcso1607901d50.1
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 09:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785256796; x=1785861596;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/LrnnQhrRdDODaNl5ZAxVM0anW7PbqV33hp9JNvKAU=;
        b=r6oGuPM2WEuAb1IzNtTxYKMa6LfHfdySqBetMV6Sgcoi8UbEWLTv7hZ64z4BRHGYOf
         FAapAV18LWgfKQG5Amq6SuG5iJWgWY7+FcsaWUMu6zOrKgX2Y4dacRkCMCDTTfqaIuGE
         DGYwmHPAnhMslzmGLkTtnrbrAXSfyTU2EZGIo8kdX18fe6Et1FlYZ4rueM7i4/Wi/218
         xU8B9fx5Xxq68YxLe5Be88SpQEmHWpIk9K922Omk/PunmOcW6D9UIN1QPyPp/37e8a34
         NBxioyG+BWLIpYrolLItddNxwrJSWCeG6I5Dpsk9DWwWrgVNsnjWfqOrrRa6IaUOdflv
         aH0g==
X-Forwarded-Encrypted: i=1; AHgh+RpHQwlgFvpwJVNVAhYRzAj+3ofHv8EHVllhnIFZEgVezrnW67zohcKpIFN4wdo2Y8tiD0t5dG/MXU8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5tDagj3tEKMqlsU7L23XOgmTzaeXVnX3+faovJ09hyIFvHpwm
	gcsDhDHDZQdOEHrQLL6Dtaid9tyNL8SoG+J90W49zRsa2RxrLGHyRnJFKexP3ufZjXJVxz3YgIq
	jg/ALB2udVGPj/SSpfEANv2gJ6ntMKKtftdSY5bz3f0c3ju4MSfASwEtSSKsH6tW1VDxYqiArTh
	3J48IZzAudCJltm2+CnVfcH5HRpubMJTd2ef3rcSncLk8fr/Z9tNRyUo6JcQcoAUz1SS4HGpsEU
	9Xr8lQDp5IdeKZz/Nqilg==
X-Gm-Gg: AR+sD11yCdlB2fGENCmYv7DQA/nchgdubYlB2mvjsggj+xnxUUoALo1DE9rb1F5xPhq
	RdDHlm/recVrs6sAE/5tglxGB26NF7XgMOgdZP6p+652AC6ae4yXHTuSJby6vo8GacKRDCDBOOA
	z8Hy6x/CMCa7Hethzya1BJrXBZEgBfGU36ysSsHWgv2v7w73VoPXC9q+cVY19STHMWeLDPGOEhm
	8xguZl++6zZCwaJPw/vhO3qSq0QDhwxtebXQ3RrkjcmxMvVg2i6zk+LGo6vRXZUHB7ot0ZwjRkW
	SEFQJNdtMdNusvGYUBq7XfjJ1yyJemctZ5FVxuoAOEtfMV4KdQhX4Vde6Y0ODl525ygKtMZWaEw
	pM2GYBqlp+QzBdgI9eCR7poZQgI6Ih0H6gwC7fq195bz6RTYGwSiARNpZIq4K+/sSmCZlkxXMjD
	pQHfnaM4gjtbqOESkV3lpnOHyfbrjfHOr1QcJ0xNo=
X-Received: by 2002:a05:690c:c509:b0:81e:c500:c6d0 with SMTP id 00721157ae682-81f99020347mr14202907b3.0.1785256796282;
        Tue, 28 Jul 2026 09:39:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-81fa28f55a9sm185897b3.14.2026.07.28.09.39.55
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 09:39:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-698af52daa4so4188285a12.0
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 09:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785256795; x=1785861595; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/LrnnQhrRdDODaNl5ZAxVM0anW7PbqV33hp9JNvKAU=;
        b=JWLxeJpzDSaTmnQTQkZ9xLeZtLXqWfpHY7A5+e14iRjeTVHdH7XDQ5V4ecbcMVUk0A
         UvFceYHvogubeTXUOuwMfeU4TZswwRfvhd+TdpqpCVsJkVus09TjdJHGyg9BfonD4ZQB
         P7azUS0FT5jxBrTNW0vYE+70KJIslP+eYoGa4=
X-Forwarded-Encrypted: i=1; AHgh+Rq8vk4U+dbc9qWi4Dmus+WOfFWL0hRZWYrFVaoECTzeZdHRakPbqOYeMZ8J+mc0DeT3VgHk8gfR9uw=@lists.linux.dev
X-Received: by 2002:a05:6402:ea1:b0:69a:57fb:4783 with SMTP id 4fb4d7f45d1cf-6a034a1c0cdmr1646748a12.13.1785256794799;
        Tue, 28 Jul 2026 09:39:54 -0700 (PDT)
X-Received: by 2002:a05:6402:ea1:b0:69a:57fb:4783 with SMTP id 4fb4d7f45d1cf-6a034a1c0cdmr1646734a12.13.1785256794359;
        Tue, 28 Jul 2026 09:39:54 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb55439a0sm4275982a12.16.2026.07.28.09.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 09:39:53 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>
Date: Tue, 28 Jul 2026 18:39:52 +0200
Message-ID: <19fa998cfc0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <03bb72fdab133a4efa84bd57cad966d222fadb73.camel@sipsolutions.net>
References: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
 (sfid-20260728_164608_178238_1CE18783)
 <03bb72fdab133a4efa84bd57cad966d222fadb73.camel@sipsolutions.net>
User-Agent: AquaMail/1.59.0 (build: 105900627)
Subject: Re: [PATCH -next v2 00/12] wifi: cfg80211: consolidate cookie assignment for async ops
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 28 juli 2026 18:18:48 schreef Johannes Berg <johannes@sipsolutions.net>:

> Hmm. Maybe it's not too hard to update the staging driver?
>
> https://netdev-ctrl.bots.linux.dev/logs/build-wireless/1136007/14715755/build_32bit/summary

Dunno. I didn't look in staging. Will dive in.

Gr. AvS
>



