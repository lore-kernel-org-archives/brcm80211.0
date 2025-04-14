Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1089925DB19
	for <brcm80211@lists.linux.dev>; Mon, 14 Apr 2025 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623861; cv=none; b=kZY2y5U45bf7uzGBtQy3k2yiYDZKjtkeFUWL7SclqImWVoaPXqsMLR9gkMLfeYi+HMcjZa/fSwq/jwcTL7ns+kAFf9CKEQAt+4Bg1GovEM6Gavc3fVkKnlekvQXIzmuzQ/6JcJpY7WoelscgMJ9dPwBPpwHGdmvGYnPGMBgGFu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623861; c=relaxed/simple;
	bh=NXvUhNlB1aPee7uCd9a9odVHLo/yRPdk/MtLRPcDwqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0thrS8YI7ppjtqQxQIZn2dkka7mGIOA8nAPfCGL9j9fBo+l6Rxe7pHXsVXqK/sRuM2pGwPQZG1ainFr0yyAG4Bure4gwooNsPnLFQTKr8iy8NeUIVZAaIgYwdHoRl0T1xF8Ep/55xANqOL8BmPjeoac/L0J1ew7VTY4s6f2USQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=COauw5wC; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="COauw5wC"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-60208b7a6d6so1062912eaf.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Apr 2025 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744623859; x=1745228659; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CbM+1WmBZ2Io1n+rSXRsp0Md07GTpvrvG0bVbAmVeMs=;
        b=COauw5wCjUtj9wr5zHHveZYFCgMbchtKf7YipEn3/6bBAegc9soyCL0L/tsTjWFVAT
         w2XsU929WJE3VkuGkaqDex4tOGxVoFcABuhTIpM96SUO+OzynHKz6XFDfn1sSXAnH2qG
         9Yj4Cb62nOfWP//uqTSL+T/w423z5N5siIjfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744623859; x=1745228659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbM+1WmBZ2Io1n+rSXRsp0Md07GTpvrvG0bVbAmVeMs=;
        b=Y59fQvWyQvfJ7VS5Tpuh55xqtghePYhlemDwyLJQJ6/xhF9mtV9C6jGoitEmAjM/0o
         wkPOLJuURR3bwxJvfhhr655nqREg5DGt386RwLTf/KhEeNKii4NA1ANN2N7IfdYdWT10
         F+NAM4ns+Ox1Z1Pknqf0eBfQ8ibriVwdMT7Ai68EMLqN9wtY/QAA9OlrMv+9ZyvJStr0
         Fxo9sMAQX47DGcc42wXgDGnFhqVHhpBwemCByx5DFMVZz3OoooMbRQQKdyBmCuGHNB2i
         H4GCL85FIC6nzUhNY2LBFkWZu2kxojW9A5KsL2+eL3GBvxDl36exCtZ+f+Za96IfADhK
         S60w==
X-Forwarded-Encrypted: i=1; AJvYcCWYhQfBXypa8LxPySVjjy7sta13oPvnC/SN5lUH5aHdJz3zDlwqvhL0o1BGxZuKH/uadvMjBkxop/U=@lists.linux.dev
X-Gm-Message-State: AOJu0YysQd24GsSkFabEk0ZbUc+LtbI35V49hUuihrKp4p4nLIPYiI8U
	FwaQl4tlSWIEPNWfBYBnWldcVTbwURMEnD8HOJ73+kl7BHvR2cQ9xLnz4LMA5w==
X-Gm-Gg: ASbGncu9iehZj8Y/x2KA3feiOqO6avLdu08bVX94X1si+KN01vy/5mzurAF0XmV3Lhc
	SLhIeHMrIZeFQmRbJ+p/31d8FnVsH+ZJc8G7A86uVKpcB/meJh8F118JcpcgnLdFh38DgfCBlNv
	CVUfWFPlwisF6cQp7YJpCoY8xYd6SbwYXpCiZFhKEvOlu3wMO7mQX9zgES+ZLfTC5IhtWIYWcBA
	Y9MYPPNW7pYsr//WIQdeCHgDtrudv6e9rrMdTDtxzSZAlEDecl1wlajraySXeBgnX/14nnqeXRu
	llBhEhD701OcJsiEl6+o146ztdCLzykqRsfMxdUaD/QuWBB2ZkjTmZNjZ9fkkbm99c8=
X-Google-Smtp-Source: AGHT+IHoa/4/GaqO5TrPYoiHTitCv7q3FYMa5EoLzYEXRejGfSZ58lhxAhVipcuemkWz6IEsfTI5Ig==
X-Received: by 2002:a05:6870:1587:b0:2cb:c780:ac52 with SMTP id 586e51a60fabf-2d0d5d9e35cmr5396992fac.23.1744623858829;
        Mon, 14 Apr 2025 02:44:18 -0700 (PDT)
Received: from [10.176.68.80] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d096cd262asm2314652fac.35.2025.04.14.02.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:44:17 -0700 (PDT)
Message-ID: <282afdd9-bb71-40f8-bfa9-bc7e57e1957d@broadcom.com>
Date: Mon, 14 Apr 2025 11:44:12 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] brcm80211: fmac: Add error handling for
 brcmf_usb_dl_writeimage()
To: Wentao Liang <vulab@iscas.ac.cn>, kvalo@kernel.org
Cc: jacobe.zang@wesion.com, sebastian.reichel@collabora.com,
 christophe.jaillet@wanadoo.fr, erick.archer@outlook.com,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250414072058.2222-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250414072058.2222-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/2025 9:20 AM, Wentao Liang wrote:
> The function brcmf_usb_dl_writeimage() calls the function
> brcmf_usb_dl_cmd() but dose not check its return value. The
> 'state.state' and the 'state.bytes' are uninitialized if the
> function brcmf_usb_dl_cmd() fails. It is dangerous to use
> uninitialized variables in the conditions.
> 
> Add error handling for brcmf_usb_dl_cmd() to jump to error
> handling path if the brcmf_usb_dl_cmd() fails and the
> 'state.state' and the 'state.bytes' are uninitialized.

Agree. Have one request though...

Just below the code you touched the USB bootloader state is checked:

	/* 2) Check we are in the Waiting state */
	if (rdlstate != DL_WAITING) {
-		brcmf_err("Failed to DL_START\n");
+		brcmf_err("Invalid DL state: %u\n", rdlstate);
		err = -EINVAL;
		goto fail;
	}

Can you improve the error message as suggested.

Regards,
Arend

> Fixes: 71bb244ba2fd ("brcm80211: fmac: add USB support for bcm43235/6/8 chipsets")
> Cc: stable@vger.kernel.org # v3.4+
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
