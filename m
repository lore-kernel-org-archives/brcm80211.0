Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1E92E1EFC
	for <brcm80211@lists.linux.dev>; Mon,  5 Oct 2026 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217927; cv=none; b=tj8L/VkOKxxIxDC/HKc+CckxJfZ/tZ/tCDNtUxtxbZbQGC5/6Rm9KJ4YkRLBJaRCDD79csIXT06MEzYnstoJ2BHQ8/xOTcVd3QQDHcUb/IWIw+vPqDWtXLayNMzGWpyBV1hreJgGXjMhNIk6qkYI06LDVnCkNnSQ5t3K4EtiN1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217927; c=relaxed/simple;
	bh=t1p8IXQWCe6JXrYhb1ZRToxX1eE/YXZFtPZX/xQ9J6g=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=inAVvYX2U/+MS6SvtxKTQjdIv/8Slj4XU3w0QlRfnP8xtXReWwbBS86msIZ0k/y7Zn7NnxmtwMDMWG1rIdw9fVnJT4Oxu3JFaLiq2ds0D0Rec/ICPIV9c2+GUdxgSdAmV7ylWJkTTxfAWHBn9R1k2iU4PnR0400jQD6VDchs8b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=a3hczQrF; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="a3hczQrF"
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-8ab3d3c5761so1353527b3.1
        for <brcm80211@lists.linux.dev>; Mon, 05 Oct 2026 09:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791217923; x=1791822723;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajrYDjtgXCfiLi8lpPhx25OD/gxlpMH/zqd4lkGdZpI=;
        b=CIH6kEAULY+4ZUCydiHPkK9M4CH220hFcHVT2K0sCoiB4szQPCLeW2bL0g2Wxj7kca
         TUkcvc4XRFXXW5/7hBT/Cb7PmG70/U6OHjHMm/iEEyD7JmOfvQU91cAMapo2sgHhqTD9
         gQDLFpH7P7WiP/yrawP8D6fdozumEJHzvT4x48qIWZp7zHTXJUs2w/7/xz6CVC3qT3R+
         aGOPnPuUuyLI6qU7xIwZOtuSAGg+MDHDukuOAQ53wpzNPbe7yZxKWKLYnn2r0xBNij/1
         fmLJV/UjuQvIH4L1wnrCk6deahfdS5JrmIKnFQPHSvJ9E18yJTxHBecPvdWwMJmUpH/g
         nRYw==
X-Gm-Message-State: AFq9FYLmjs8HCysWpSB0OPX2GfTKc6mMb8eYTHXHIW/e0QRfauj1kOxl
	8sHs7y6b1O21bhnrmS0jFi7cTvG5S7XK5LCffIPtfCho/hYgZH3Xu+WmDd8X8tsIsUZTCgAqDLy
	iN+ufNO5YONI9nyd+lM95cWUBxAOzzjSzLXY1RlPb3ezAMNW+Rra16N/ljDVeByPX+6vKRwzlQv
	pOxuTn+NvYm3B1xbfS+UoaTmmZg3k8x/1EPI3yvWKCHsdU4b9k0XVbiFvSc7t3UUcygkLr0m6QQ
	2BA7pneCsYj5tqfudgQhg==
X-Gm-Gg: AYBFou0Xv4++8Qlt7p2938L1BNUivZrQTMNE17t8hLxdSR67rA1Lg5tg9+oqFVP8Bmo
	UX/qYKCqS1p2QzjOd3BCg+YZkFBzg9RazpzknB3CwV87UYKHJKLPULHdSt70NKgJAq/5wdHY2RF
	x9rA4gsvFMRf6vMSRhwhVZ+hFIdRLxd3ay8KmfFv7tUfXLgVH38QFg0spNRv7rt5GSWWHC2YqLK
	/7LNLI0e6RbLIq3dPatbeIs1xwDy4CabUyfdP2HiaD/3sXSZmkkHCTz+MSsU8RCM8ucxBNfAgic
	NwJ3H+uQzfdxAtwD2c39gZAcWnbYXU3YfbhjnJ1MoImP08i8uwsRdhInkIyk9GtvBHKLUZEEgCs
	WOCmr7qU4G5vrm23Zs6HQKhi0b7ASc5vRt/q+IFUKcQNLdmf0XW/f5zR14snsmivn01h0KVqYCg
	jroRFdA2cJ1pG5O1KCJVSZaBu2XqAdM4aGNxmOBDo=
X-Received: by 2002:a05:690e:b82:b0:677:c075:a57a with SMTP id 956f58d0204a3-677c075bf2emr2547720d50.108.1791217923341;
        Mon, 05 Oct 2026 09:32:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-677c1b6df8fsm1334713d50.22.2026.10.05.09.32.02
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 09:32:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2e49c5ff09so224074466b.1
        for <brcm80211@lists.linux.dev>; Mon, 05 Oct 2026 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791217922; x=1791822722; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ajrYDjtgXCfiLi8lpPhx25OD/gxlpMH/zqd4lkGdZpI=;
        b=a3hczQrFnkYyBwBj+4MmKqYUYSM8mTNwMvpoQBYmG26/v7fYT1WVhgDyhiIU9roxzs
         h8R5Y7WnRgqPU3w4V2huaDDaSizhct753mw9p0AUxMbNQf78ToeO/o9mwia5VuFq9ysI
         k8FIMKWhWfQnso1atIsv+mf+eRahOMQJFv/bw=
X-Received: by 2002:a17:907:720d:b0:c2d:d202:d1ee with SMTP id a640c23a62f3a-c2e4adaee21mr972821066b.36.1791217921792;
        Mon, 05 Oct 2026 09:32:01 -0700 (PDT)
X-Received: by 2002:a17:907:720d:b0:c2d:d202:d1ee with SMTP id a640c23a62f3a-c2e4adaee21mr972819066b.36.1791217921362;
        Mon, 05 Oct 2026 09:32:01 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31563018d8sm99716966b.51.2026.10.05.09.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 09:32:00 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Nathan Chancellor <nathan@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, <stable@vger.kernel.org>
Date: Mon, 05 Oct 2026 18:31:59 +0200
Message-ID: <1a10ce86418.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261005-brcmsmac-clang-24-constant-conversion-v1-1-a30c5692d582@kernel.org>
References: <20261005-brcmsmac-clang-24-constant-conversion-v1-1-a30c5692d582@kernel.org>
User-Agent: AquaMail/2.7.0 (build: 200700061)
Subject: Re: [PATCH] wifi: brcmsmac: Adjust txpwrindex value in nphy_ipa_rxcal_gaintbl_2GHz
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 5 oktober 2026 12:33:07 schreef Nathan Chancellor <nathan@kernel.org>:

> After a recent change in clang to warn on signed char conversions within
> array initializers [1], there is a warning (or error with
> CONFIG_WERROR=y / W=e) from nphy_ipa_rxcal_gaintbl_2GHz:
>
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:224:18: error: 
>  implicit conversion from 'int' to 's8' (aka 'signed char') changes value 
>  from 128 to -128 [-Werror,-Wconstant-conversion]
>    224 |         {0, 0, 0, 0, 0, 128},
>        |         ~               ^~~
>  1 error generated.

[...]

> Cc: stable@vger.kernel.org
> Fixes: a9533e7ea3c4 ("Staging: Add initial release of brcm80211 - Broadcom 
> 802.11n wireless LAN driver.")
> Link: 
> https://github.com/llvm/llvm-project/commit/a5ef934a8d295dc03be3960f2b3744ec2e53238e 
> [1]
> Link: 
> https://lore.kernel.org/1a107e21b08.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com/ 
> [2]

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)



