Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471D1CAB3
	for <brcm80211@lists.linux.dev>; Sun, 25 May 2025 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748166377; cv=none; b=UCl/wQ4t7pjfglCQUdQYI1wtJc5HMtwB+LX1G9Mu74dBHsOcESvA79zayjJQGjzoxLq87M9H7ZTCrOP06ipK5v7s1FhKr5TulOeyYwfcFwn5vjfzDNO2Cy/msXFNGeAJCw+o9QPuOBHIA5Tne5JAp+/pOnoaiiRlMYG4TVlXrwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748166377; c=relaxed/simple;
	bh=0wBEbtMo/dEu6nPciUlVjZNzC2evI6460OinFgAKdw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oED5rp+3lIXfujetw5XEhpaey+Apf8QFlafRsyCk9W/yQ1ZYafAWOQ7mmTIjkiLoCMV11qMuffWVfw0ni1QCLRNI4HfbQzGT15ebieShCK0VsNb9GNLt0GQr9d68/6QCP2vwa7UIfIYDZwMzv42RXtd3iad+elZjYdx8qtnzsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UuXXqCDE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UuXXqCDE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c33677183so7504275ad.2
        for <brcm80211@lists.linux.dev>; Sun, 25 May 2025 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748166374; x=1748771174; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkhLq12mNLSL/Sq/6LO2cG6p6ELKgDsmz2OzqCO1eug=;
        b=UuXXqCDEhe8Lc2ipFf9gMBmT8uo2RRVzQaCjk7wlQnAT1slG336ArQGlRiHfMAR0SZ
         yYm49HGSwbuYY/CVYgkw88VL3kEaYlokznjQRT8Nig5QaTQq2IFyDzDWMsA4Dn1kJqd4
         0S24l0zkaPDtAc1PG41kMwiPaDgR6emSttg4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748166374; x=1748771174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkhLq12mNLSL/Sq/6LO2cG6p6ELKgDsmz2OzqCO1eug=;
        b=GgAe+GLh2gDZ/EYvOEfD78Dud4IVPndwJxDzYeLFjoO2GUr5RTVnc6r0OM3XH3sQKK
         2mSBE/PbiHUmfq22NpSotNP7WPMxUH/XlhlydsYHYpvUqTkuMG4VaApseR6C3im3qboR
         C3i7y33fIXU7zy4Is/TnGhZyJsQs7nzv4mBAsQrDTeMhisHmzCadJM2cB0P9HO8YwEuN
         J5pNmnTaFQTHh4W3GDR8NH+fk3uONCS9IAJ9L37wHKiHl/KgBwTCiaZl4Nu3ACHumk7r
         1C5GxWJE4ogMHN5L0RNAEmUShFQDCdI6pijadvqrSZjDd4c3YLJ0Py7IRNXKxZ3aMI0F
         aGUg==
X-Gm-Message-State: AOJu0YxX+6lhpoAVbechy24EC1rrBvb2VTO745WdbrEOYA7ZqTuNS/pw
	6dLxH4wq1jlx4iMUjsUBtcJ1r0/J4+OhRgzy4x+3TAoh3TdHgRQrwLTSnmUr2rKnrg==
X-Gm-Gg: ASbGnct+mDwsgiq7kiN7bkxgA67mUfstPC4cDFCTqBeD4kD2DYyI7ku6NNLHtIUej81
	Sy2x9tsJsOnI/qrMtYJSxDgVuzUhbIAcTPZnqyF9fxduq1i2nfbfvArI6LLNpPzJorT96y1Ed8z
	9orvopfmAcbHMwR9i0GYgpZNDnXhNQEt8LwPnn0csbrUArgPujIRYijoZg7/fIqWnnXjlxdTNft
	vi2tfgGOCy1UNYKQtPduP8KBHCOm7zaAwF/DSCwz86nLsE/JUIRDMc7Ql77VWpzGNuX1D9arBNJ
	vKwX9NdUzzNeM3c5dEXbfh/tDaeF1Q6oU5Do5er5n7iH3Fcgv8A8DWXYPsSiv7C7U2CHoE3YS3y
	4hOkte9c2emvffJCael5fA+MYHVc=
X-Google-Smtp-Source: AGHT+IE3q12SpAvKuhj56MU4kYk8HQwHIwtih366RTgP5l+dGpIGx36fkbIQBu9uzwUgmvexa9pscQ==
X-Received: by 2002:a17:902:e544:b0:22f:a4aa:b82b with SMTP id d9443c01a7336-23414f62af9mr94275775ad.21.1748166374404;
        Sun, 25 May 2025 02:46:14 -0700 (PDT)
Received: from [192.168.178.137] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23429f0c98esm16039725ad.47.2025.05.25.02.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 02:46:13 -0700 (PDT)
Message-ID: <70444507-ff51-437f-baaf-d2d5377adaef@broadcom.com>
Date: Sun, 25 May 2025 11:46:08 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 0/4] wifi: brcmfmac: external auth
 support for Infineon devices
To: Tim Harvey <tharvey@gateworks.com>
Cc: brcm80211@lists.linux.dev, Johannes Berg <johannes@sipsolutions.net>,
 linux-wireless <linux-wireless@vger.kernel.org>, hostap@lists.infradead.org
References: <CAJ+vNU2pLJd696Fc_98arrzs8QK70HfstPrZv6zVJm3G13REHQ@mail.gmail.com>
 <196d7901068.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAJ+vNU009QSwYopCFzZtwDNXDBppx7L4v_ZKtmNZ=5ep7trOSA@mail.gmail.com>
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
In-Reply-To: <CAJ+vNU009QSwYopCFzZtwDNXDBppx7L4v_ZKtmNZ=5ep7trOSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/2025 1:38 AM, Tim Harvey wrote:
> Yes, I'm using hostapd for AP and wpa_supplicant for STA and now I'm
> thinking this is likely an issue with one of them and not the brcmfmac
> driver although there are always relationships between hostap and the
> drivers so it's hard to say. With more testing I've found that the
> issue does not occur all the time... in fact it was difficult to make
> it occur again.
> 
> Here is some more context:
> - board: imx8mm-venice-gw73xx
> - device: Ezurio Sterling LWB5+ (SDIO single-antenna using CYW4373E)

So you have two identical device running with brcmfmac driver and one is 
playing the role of AP and the other STA. Is that correct?

Regards,
Arend
