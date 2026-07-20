Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4752B31354F
	for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784573298; cv=none; b=E0r2fwQ6pAdks65FX54Z7MnDUnhKdsd9NqEKbEkGDI13zCJgQVabzS4SrU2umzLjAI3qljHE8NA+pis53zokYdECVRaErDX037SSCWKYvTffP7zCYNAq7dveRWqp4cqTzcgsb4Xz+VQyQZzZFNZQuPXC2OhkjvMnMXfPe4C+Kno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784573298; c=relaxed/simple;
	bh=/r6Y2ugy0XUY1yvAgSIuLLaf292AISI28KxNzjj7EtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OmFkvNn3ZWLv3fv3Zj1pUvHtaCmXxi25hs7vbLPqVI0T9MuyZT/D9wo+IOC46B3uCdY+t2xY2DHmm27+NZDA5I4xLym0U4jFkjLFdYCIA2bXtXtCddGRPKFIObTo2p7+zsFmMae9J299mQxrkjYdJae8d2XjsAgrnqqpbIrIl5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ULWK9Wzd; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ULWK9Wzd"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2ceae1ed204so83975425ad.0
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 11:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784573297; x=1785178097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p8t7Xg+RzoNYnR0lY1jTPPZgjUIjAoBXW/16uw7Qbwk=;
        b=K6cSM+xf1trmBnHWs4WNNQOU/yG87OUqiUNn72wCTMsjTcYYcMIyH5KZjFNROKNuso
         J0zEvHH/x1E+Wf9BulFVlzbXBJ2xD/WbZo+F69RTRBOsy1TfCexzzMWZR7hNRuThokce
         zPRkAXghxBTeDJut6JLe/4jVcfk1zjDRbmyvPWhco2vz/m/Hogumko073TN/zbEzQDDx
         VMdAUwE4DjP/F8gvJXg37fybKSEXuKC6B0aHvz51numkRzFfpJJRprVYqEA6evzNlwIA
         TOggIgbaB3F0uVcFt6nIRjhH6cJds4UyUAJtl/UnAG5CO0m0UFGhRneNX4NpTDZpyQxc
         6oUg==
X-Forwarded-Encrypted: i=1; AHgh+RpwY2npwIOxWxh8s8eiuVsw0aZFRNVC7otiilJ6ftouuqkxsWLHQB57MZuaKgqmhiznDxPN5+InvJ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzouADG2AGczrymbhL8uXecupZQ2avhFA0KlcOu5YexWHeH0LPM
	jKulnqIiG2DXlQrRES7yZ2/BtTMu+Bb18QJS7hm4WqAoXi/NLwdJxK3ND9h666lI/UeXjonGuRq
	gJDI0yaJ/+69Wc9BS/FdHJkK3GwR7+D7IBzCe1or9fR565vSiwZjIMHdKm4R+oh1IX0L2c4maUV
	NH2rnB+pwVtuX5chj/d5vXdHu/hIl68O1X9ClaLlrXkvj+gyoaS+zrmNiG6KC4anhUM+pkaYjBc
	Zk1++cqRBdVho8vEqKkgA==
X-Gm-Gg: AR+sD12sSoZvU4S7ewlrxBXF1MlamfNeeaIr+y6r+2xugAEosCtzi070dc24pwv+gCP
	v6AM6AiFG5O+tI+6GM5EF7hchTr3wLnX9brwg6Yn1iSKVscQxAMfs8zQvdHwJ0xGKvF1qYSP3w+
	Nl25HsicGcWPWIrwdILkZZzDO+N+7E8/txxgd3IvHG/f1y1URsW7cFsVUODh16NAFywafyrqj2h
	B5VfGmxP0SR6sgEKCuj1t6EqhPXLj8oBQ8MGK/eW9C/fs443cLGtmzfxAVoHiCjdRZqIEP87MuK
	QicbKzhJN709Lc/aiENUSOLCNtWA8+1HBZOV+hq7uhY1yetFj5RwH70SJxMRKHkpFYOO5259oOx
	NlctUJuIO91y4dKV0kw9g/p2Ff7rZRpXKw8GWPXAqSs3ifsbXjSlBpPCyEDvnB7zJxQe/IeUJlR
	+wTvU/WPUopwcGHAMbhMFcZMVbIRfED74S+P2/FHI=
X-Received: by 2002:a17:902:e541:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2cf348b0a43mr169039595ad.19.1784573296508;
        Mon, 20 Jul 2026 11:48:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cf346606f1sm9438685ad.34.2026.07.20.11.48.16
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2026 11:48:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so3305665ad.1
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 11:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784573294; x=1785178094; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8t7Xg+RzoNYnR0lY1jTPPZgjUIjAoBXW/16uw7Qbwk=;
        b=ULWK9Wzdm+mIJMLf3Z381QPMugmAePd1ImkCMkGTi+JrLiLii2zPkDU0bk5VsVoBWW
         kjGAWFBKvz4TRiBNktxLEZsSPXuzNbjW5f1bCVCVK2z/mbx+xgPi2Wq9Oi+TLWXwEqnT
         +UsuqnBJ6oO55u2T3tRWUUOtSkcr5v+vxq6Lk=
X-Forwarded-Encrypted: i=1; AHgh+RrFeYU6K8vnoO2JIr3xd5UD0QjQog17DRdx+veDeAbdGprS5mNgZyirKQ/niJBJHpuyYIhVtClxE68=@lists.linux.dev
X-Received: by 2002:a17:90b:2ec6:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-38e6a446b78mr5818365a91.0.1784573294638;
        Mon, 20 Jul 2026 11:48:14 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec6:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-38e6a446b78mr5818343a91.0.1784573293687;
        Mon, 20 Jul 2026 11:48:13 -0700 (PDT)
Received: from [10.229.41.154] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2c93sm35687096c88.3.2026.07.20.11.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 11:48:13 -0700 (PDT)
Message-ID: <f9bcb849-cf98-4398-aa72-0b32885533fc@broadcom.com>
Date: Mon, 20 Jul 2026 20:48:08 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: brcmfmac: add DPP support
To: HungTsung Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260708071230.312836-1-Jason.Huang2@infineon.com>
 <20260712223314.2182929-1-arend.vanspriel@broadcom.com>
 <20260715092229.GA667683@ISCN5CG5251XQT.infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260715092229.GA667683@ISCN5CG5251XQT.infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 15/07/2026 11:22, HungTsung Huang wrote:
> I agree this is a pre-existing P2P bug rather than part of DPP support, so I
> moved it into the standalone P2P fix patch.

Hi Jason,

I must have missed the "standalone P2P fix patch". Can you provide a 
reference or submit the patch against the wireless tree if not already 
done so.

Thanks,
Arend
