Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA173191CA
	for <brcm80211@lists.linux.dev>; Sun,  1 Feb 2026 09:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769938656; cv=none; b=ckbLBflGNON44VwzATHBkixh4S/9lADYA/YRSwggCaJ0OMUddpe/V4qbtHIb1l9ibiqLp8UOTG3xrIEOXtIkYXRvK8H3MIUnp+b5oH+xt5dZnl45+QUJgj43OXkVgp4+WYD6TL9l4KubUnSmJOik0/Beaz8PVhktL9ZZTkwq3oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769938656; c=relaxed/simple;
	bh=M/0Hnb+R8Dq1QHIiwBEGpxuUzbSdVZOGIUxFZsjTxVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hdX3pZPSLC9OmboXRniKb09KUz8wHxYbgdOgggnh5b6XRlM2xRpH4YHBPRbV4r8OyeEU5naUqllo93eMSUt832+A3GjGXiU68LpYCGZ6h8RLhfZ9TKYUPtjfIa9Pnlh0LE8g1cM1BMvlD2FaYwFgkLsBqlnUjb+asfOCUOf/YqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=G/4qgl9d; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="G/4qgl9d"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-5664848545fso1346243e0c.3
        for <brcm80211@lists.linux.dev>; Sun, 01 Feb 2026 01:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769938654; x=1770543454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qnu/SgU92pbwPypfmo2wXrvY+QLkc8ZneC/N+w9GCAU=;
        b=nfFiNNPjk3C4PorXjaZQo8FKuvBsHJL65owGfACxPMZA5R5P/7wWoFoVEaZQLX14WI
         fwFYKL5uhaGQ7D3TjhqQaqCQ++JldESpyfFrkjxxuY0LaYW2tD972MSnCps2muwCVeTf
         qo/zEukuw1cTpYF/GF2Vj6fVnuHIzO8ohAHqT0F8AJCsNJCN/IOjwHQqcNeHMg5NCy7K
         wmPnPtzzCiTF6n/g5Ifz0cEiP0DlWQZSKzSY/KNntw8WKnqspp84ugVlNcR8TkdIDji3
         Xg3p5tUALlf3LPu83ePb3gMcEdANMkiKW+ZtQAWUy/fI1D5qkNg5mHzXHoQyey7YCPdw
         /vYA==
X-Gm-Message-State: AOJu0YzQunLKbbXl6Njh5iD+/xpBx25J11YqD/uc3MnLtdIzDMC6c4y3
	2K1iV7l9c59T+IL9Zgr1mymULUD5IdKT0AHvARADqxphLN1BUokXeltze1YD1p/3/lUeD6BGIh5
	sXx+XgOPTvx30f04J76lYvCrrjAbFJUw9+7giB9pqEfWoVG1OeWim0rWvzPvm2smajG3a7D7C/X
	xVcw94rxoJ1k0Duqpzaz1ME1NCkGkVo8E3J2cerJvadtJ5bWK0S2c3Cgckpd69k9rmVvA4uSZi2
	4XmygF2onZJGP3Aj+yUDQ==
X-Gm-Gg: AZuq6aJh7Xl+Iulz3MAXa+Zt9sWAXXMlA+gQ2X2Vnw1MXK3OSwgXw3w3Y3Pmx6zH32R
	5lPh/+Tqdj6RBx2kIO2Tf5YQCIYiHdZQpEa9TIbcyuXXzCmgO+1LAw4GzEAWcBT1NAwSqmKS0vj
	f/em2WmFNDSe9Y1aZkRybzAM+0yzJO5aXS9Hlh6p9QpFXxuR5nchwrMccnsKp5rE+mU52ZrMoHz
	uoRf84cTCQezI0K5NfxiIJMEp3cz5dXxTil8QHvncuxAAlV5vsS/wOQek4GVjhRmOZxe0SOEdNN
	AnHZr0UfUGIIlI4SmGOC6Zbv011MqGBLCmzIuBQa3XoVRv/CDsworBBxszAFA9LRa4bAx9jCz4W
	uqfRMvSBpCBljEVC/xDrvFckCE51wmsjo1pFfWUDFuzrbM6n6vEctbk4lshWq+79+PAVTowwI2Q
	xfGSVDKClB1DsE5LZVWBp7xURZYJW41St4SEM2O/AxG3Xe8ZpZ
X-Received: by 2002:a05:6122:1d50:b0:563:c3e7:6132 with SMTP id 71dfb90a1353d-566a00d7603mr2052034e0c.10.1769938653719;
        Sun, 01 Feb 2026 01:37:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-56685bd102asm1702978e0c.5.2026.02.01.01.37.32
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Feb 2026 01:37:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b88484ee1f7so398988666b.0
        for <brcm80211@lists.linux.dev>; Sun, 01 Feb 2026 01:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769938651; x=1770543451; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qnu/SgU92pbwPypfmo2wXrvY+QLkc8ZneC/N+w9GCAU=;
        b=G/4qgl9doHpN84aSyaTHVsaoa3E5rDhXJSqSwLNoekqVHv0IyBmtGA6jgTYFwMozAv
         RA+/eRbEuT3pPv08ENSCYSJyQeHZvI1hsVBz2OJhmertPr6uvH7a/12GO4ghz6Ch1VA7
         Nhh0eS5JIW3K7NNCv5wvAGjqIcq2eL/3uMGhY=
X-Received: by 2002:a17:906:6a12:b0:b88:58e5:86ff with SMTP id a640c23a62f3a-b8dfeb307f0mr597040966b.0.1769938651315;
        Sun, 01 Feb 2026 01:37:31 -0800 (PST)
X-Received: by 2002:a17:906:6a12:b0:b88:58e5:86ff with SMTP id a640c23a62f3a-b8dfeb307f0mr597038766b.0.1769938650846;
        Sun, 01 Feb 2026 01:37:30 -0800 (PST)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de289bdf4sm554275666b.44.2026.02.01.01.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 01:37:30 -0800 (PST)
Message-ID: <9dfb36bb-07be-4559-be83-39fe5c4dc9aa@broadcom.com>
Date: Sun, 1 Feb 2026 10:37:31 +0100
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmsmac: phy: Remove unreachable error handling
 code
To: Ingyu Jang <ingyujang25@korea.ac.kr>, linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
References: <20260131172355.3367673-1-ingyujang25@korea.ac.kr>
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
In-Reply-To: <20260131172355.3367673-1-ingyujang25@korea.ac.kr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 31/01/2026 18:23, Ingyu Jang wrote:
> wlc_phy_txpwr_srom_read_lcnphy() in wlc_phy_attach_lcnphy() always
> returns true, making the error handling code unreachable. Change the
> function's return type to void and remove the dead code, similar to
> the cleanup done for wlc_phy_txpwr_srom_read_nphy() in commit
> 47f0e32ffe4e ("wifi: brcmsmac: phy: Remove unreachable code").

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
> ---
>   .../wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c   | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
