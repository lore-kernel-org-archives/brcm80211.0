Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CCF37F8C9
	for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774693475; cv=none; b=gOLljI2OjoPGe/5WPfSGcI1ra3GuUh59GN7rS/kiHtlx9A9yTjieWDzxoISYlGOPrGGPzxUnrmBM36WZgwu13xIezQFawj6HbFyOpLO/Ln0d+17kLkIMSwZt+w4B2m0ifR0Wh3IyLAcxNp5GM7Iq55fJV+RBekz1T8qUXF/wxmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774693475; c=relaxed/simple;
	bh=X63BuHO7l4FwdnjdLvSgeQn4alRbYSwxzGo5a2H4RQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJ/HXgsAmWy70Ychf5E3LhgaQxdpDVPm6TR6ynxAdMk/W0EmawlsFXVp/lYoghaWYQsMk3cXtli7HkwNP3cAATpvE9jMfzbhQ/Y13tIDVgfJKt2bWrHS9Mwts1Lcp0BTL8SVb/IrLkzt4MN0d9YcLJND7TAJQqwTzMPz30z2XFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bt1kKR4b; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bt1kKR4b"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1894355a91.0
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 03:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774693472; x=1775298272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z6XToHzShSbS4z6LLqYdt6ioDXJGQ3ObdhmulepTmGM=;
        b=rNiLoRJeUTyR6y8cXZnQ6jH9bh90hvS/T1Q3Ynr/ZrPTnO6Z1yVvQ4IBpFGyiDWJDD
         ujLTFvEhx5LU8rMEQHbnHmNMq1J7d/CDC5CQkQNd3Iazj7i5obJivlOM8l5Cjt4G8gR6
         eZW3ZsSZfzH05i8hkgkBAhBJTy1IGiSakdg7TKec64TdmKUZ6AqoWEOy/0IypvCPyMWb
         91L7lGh+QaqVlzjl3bCUXAcH5EllMiIxPRCrSBQmWHkHKcqQGGmgAV1HiJ8XqIgQDmBf
         8APp9963OoLlXAz0MBcthGNQt5EwbwVdmf97nrBSPT4u/38DbanEjw8r2Ng6W8xAGzzT
         IZjA==
X-Gm-Message-State: AOJu0YyzbLKjZWIUDyqxJQ088NTS2/pYjR9Si7ZRIHHvJe8KChMgiWBc
	Hh4klue2aTIpioRTcUaOdW1MbOdVAbd6++uKPEXrnRantqO7cJPKcrFi7SG6nvxzNpASVpSK5wV
	ZqTZNXV2vA/gzVsHgU53X2XcPJ+BZZwV67v7d/xH8BaxsqohThh+13qcreAl7E3LsVBmYjZh1lJ
	q7ooRoE3s4LuNpJppBu00+DgCNDVaENFPZvY5UUlYWxSMLjRNWz1dn02J0AyVZTRALcH0jARbpM
	LA3I9mJK5jGaeDKh/Srjg==
X-Gm-Gg: ATEYQzz9T7T3YeYnwxqdRqIfUiQIVuqxXyF0b3maNt/JGRUfZ9OiigSPpTFw5vHphAo
	LGbsCoK/YGSKGbESl+Oebek8I96npKWLcx9Dt3L+rifj4ZEdkn+UiQvweUG1S8gkfO/JzFc7he2
	CVbM82Ckah/BvXojwIMXiCPSOw6sHC/pO4+oS3wruA5Qiv6eowiDo1zjomnWrVX635qcVUkb2cz
	YezLfXTexmfDuwZ4kOQqUIkxxsgyYJFas/p3zNAnBUYElDZmd06tvmihs76N3qifXbKHCXO/d0l
	p8/SmHBNiSyw4vsZXvf0/ZFlVnipy9IKE6fK6fCPLH0VPtPv30vFByScKpaKkiF7Zi96YXOjOQU
	wFjwIiLPxyfIC2zyAOpBTlulN3gIi2KQDDx+uP5u9nUPMJWeZpEs7+f5JsYvvqBOGGlKe+8V3Z4
	oOp483e1i7
X-Received: by 2002:a17:903:15cf:b0:2b2:42b1:ad95 with SMTP id d9443c01a7336-2b242b1b0c6mr21572015ad.16.1774693471928;
        Sat, 28 Mar 2026 03:24:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b242780070sm2271075ad.51.2026.03.28.03.24.31
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Mar 2026 03:24:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b9763bb6d44so193429566b.3
        for <brcm80211@lists.linux.dev>; Sat, 28 Mar 2026 03:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774693470; x=1775298270; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z6XToHzShSbS4z6LLqYdt6ioDXJGQ3ObdhmulepTmGM=;
        b=bt1kKR4b0ygNiB4U3RDkWimkDVPodfTRBkEGj0R4HqTAjeRs8Tggv5Rf6IamiajwTJ
         EW76Xnhfh9mOHd/59DJKvZFd42036I8XSQDKB+DLsuI2fpmQzt4nSups+5FSlVQLHKgl
         2EyYpw94OUQtbINHFrArCUKdU2bSm1hKuxPTA=
X-Received: by 2002:a17:907:98c:b0:b98:4d0c:db53 with SMTP id a640c23a62f3a-b9b502ba4c7mr429613066b.5.1774693469593;
        Sat, 28 Mar 2026 03:24:29 -0700 (PDT)
X-Received: by 2002:a17:907:98c:b0:b98:4d0c:db53 with SMTP id a640c23a62f3a-b9b502ba4c7mr429611666b.5.1774693468997;
        Sat, 28 Mar 2026 03:24:28 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b801bf80fsm53373366b.0.2026.03.28.03.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 03:24:28 -0700 (PDT)
Message-ID: <9eb8c212-4dad-4637-ba77-f6115b2d7267@broadcom.com>
Date: Sat, 28 Mar 2026 11:24:29 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: of: defer probe for MAC
 address
To: Rosen Penev <rosenp@gmail.com>, linux-wireless@vger.kernel.org
Cc: "open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS"
 <brcm80211@lists.linux.dev>,
 "open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS"
 <brcm80211-dev-list.pdl@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20260220022739.41755-1-rosenp@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 xsFNBGP96SABEACfErEjSRi7TA1ttHYaUM3GuirbgqrNvQ41UJs1ag1T0TeyINqG+s6aFuO8
 evRHRnyAqTjMQoo4tkfy21XQX/OsBlgvMeNzfs6jnVwlCVrhqPkX5g5GaXJnO3c4AvXHyWik
 SOd8nOIwt9MNfGn99tkRAmmsLaMiVLzYfg+n3kNDsqgylcSahbd+gVMq+32q8QA+L1B9tAkM
 UccmSXuhilER70gFMJeM9ZQwD/WPOQ2jHpd0hDVoQsTbBxZZnr2GSjSNr7r5ilGV7a3uaRUU
 HLWPOuGUngSktUTpjwgGYZ87Edp+BpxO62h0aKMyjzWNTkt6UVnMPOwvb70hNA2v58Pt4kHh
 8ApHky6IepI6SOCcMpUEHQuoKxTMw/pzmlb4A8PY//Xu/SJF8xpkpWPVcQxNTqkjbpazOUw3
 12u4EK1lzwH7wjnhM3Fs5aNBgyg+STS1VWIwoXJ7Q2Z51odh0XecsjL8EkHbp9qHdRvZQmMu
 Ns8lBPBkzpS7y2Q6Sp7DcRvDfQQxPrE2sKxKLZVGcRYAD90r7NANryRA/i+785MSPUNSTWK3
 MGZ3Xv3fY7phISvYAklVn/tYRh88Zthf6iDuq86m5mr+qOO8s1JnCz6uxd/SSWLVOWov9Gx3
 uClOYpVsUSu3utTta3XVcKVMWG/M+dWkbdt2KES2cv4P5twxyQARAQABzS9BcmVuZCB2YW4g
 U3ByaWVsIDxhcmVuZC52YW5zcHJpZWxAYnJvYWRjb20uY29tPsLBhwQTAQgAMRYhBLX1Z69w
 T4l/vfdb0pZ6NOIYA/1RBQJj/ek9AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQlno04hgD/VGw
 8A//VEoGTamfCks+a12yFtT1d/GjDdf3i9agKMk3esn08JwjJ96x9OFFl2vFaQCSiefeXITR
 K4T/yT+n/IXntVWT3pOBfb343cAPjpaZvBMh8p32z3CuV1H0Y+753HX7gdWTEojGWaWmKkZh
 w3nGoRZQEeAcwcF3gMNwsM5Gemj7aInIhRLUeoKh/0yV85lNE1D7JkyNheQ+v91DWVj5/a9X
 7kiL18fH1iC9kvP3lq5VE54okpGqUj5KE5pmHNFBp7HZO3EXFAd3Zxm9ol5ic9tggY0oET28
 ucARi1wXLD/oCf1R9sAoWfSTnvOcJjG+kUwK7T+ZHTF8YZ4GAT3k5EwZ2Mk3+Rt62R81gzRF
 A6+zsewqdymbpwgyPDKcJ8YUHbqvspMQnPTmXNk+7p7fXReVPOYFtzzfBGSCByIkh1bB45jO
 +TM5ZbMmhsUbqA0dFT5JMHjJIaGmcw21ocgBcLsJ730fbLP/L08udgWHywPoq7Ja7lj5W0io
 ZDLz5uQ6CEER6wzD07vZwSl/NokljVexnOrwbR3wIhdr6B0Hc/0Bh7T8gpeM+QcK6EwJBG7A
 xCHLEacOuKo4jinf94YQrOEMnOmvucuQRm9CIwZrQ69Mg6rLn32pA4cK4XWQN1N3wQXnRUnb
 MTymLAoxE4MInhDVsZCtIDFxMVvBUgZiZZszN33OwU0EY/3pIgEQAN35Ii1Hn90ghm/qlvz/
 L+wFi3PTQ90V6UKPv5Q5hq+1BtLA6aj2qmdFBO9lgO9AbzHo8Eizrgtxp41GkKTgHuYChijI
 kdhTVPm+Pv44N/3uHUeFhN3wQ3sTs1ZT/0HhwXt8JvjqbhvtNmoGosZvpUCTwiyM1VBF/ICT
 ltzFmXd5z7sEuDyZcz9Q1t1Bb2cmbhp3eIgLmVA4Lc9ZS3sK1UMgSDwaR4KYBhF0OKMC1OH8
 M5jfcPHR8OLTLIM/Thw0YIUiYfj6lWwWkb82qa4IQvIEmz0LwvHkaLU1TCXbehO0pLWB9HnK
 r3nofx5oMfhu+cMa5C6g3fBB8Z43mDi2m/xM6p5c3q/EybOxBzhujeKN7smBTlkvAdwQfvuD
 jKr9lvrC2oKIjcsO+MxSGY4zRU0WKr4KD720PV2DCn54ZcOxOkOGR624d5bhDbjw1l2r+89V
 WLRLirBZn7VmWHSdfq5Xl9CyHT1uY6X9FRr3sWde9kA/C7Z2tqy0MevXAz+MtavOJb9XDUlI
 7Bm0OPe5BTIuhtLvVZiW4ivT2LJOpkokLy2K852u32Z1QlOYjsbimf77avcrLBplvms0D7j6
 OaKOq503UKfcSZo3lF70J5UtJfXy64noI4oyVNl1b+egkV2iSXifTGGzOjt50/efgm1bKNkX
 iCVOYt9sGTrVhiX1ABEBAAHCwXYEGAEIACAWIQS19WevcE+Jf733W9KWejTiGAP9UQUCY/3p
 PgIbDAAKCRCWejTiGAP9UaC/EACZvViKrMkFooyACGaukqIo/s94sGuqxj308NbZ4g5jgy/T
 +lYBzlurnFmIbJESFOEq0MBZorozDGk+/p8pfAh4S868i1HFeLivVIujkcL6unG1UYEnnJI9
 uSwUbEqgA8vwdUPEGewYkPH6AaQoh1DdYGOleQqDq1Mo62xu+bKstYHpArzT2islvLdrBtjD
 MEzYThskDgDUk/aGPgtPlU9mB7IiBnQcqbS/V5f01ZicI1esy9ywnlWdZCHy36uTUfacshpz
 LsTCSKICXRotA0p6ZiCQloW7uRH28JFDBEbIOgAcuXGojqYx5vSM6o+03W9UjKkBGYFCqjIy
 Ku843p86Ky4JBs5dAXN7msLGLhAhtiVx8ymeoLGMoYoxqIoqVNaovvH9y1ZHGqS/IYXWf+jE
 H4MX7ucv4N8RcsoMGzXyi4UbBjxgljAhTYs+c5YOkbXfkRqXQeECOuQ4prsc6/zxGJf7MlPy
 NKowQLrlMBGXT4NnRNV0+yHmusXPOPIqQCKEtbWSx9s2slQxmXukPYvLnuRJqkPkvrTgjn5d
 eSE0Dkhni4292/Nn/TnZf5mxCNWH1p3dz/vrT6EIYk2GSJgCLoTkCcqaM6+5E4IwgYOq3UYu
 AAgeEbPV1QeTVAPrntrLb0t0U5vdwG7Xl40baV9OydTv7ghjYZU349w1d5mdxg==
In-Reply-To: <20260220022739.41755-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 20/02/2026 03:27, Rosen Penev wrote:
> of_get_mac_address can return EPROBE_DEFER if the specific nvmem driver
> has not been loaded yet.

We already catch the -EPROBE_DEFER calling brcm_of_probe() so looks good 
to me.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
