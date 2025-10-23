Received: from mail-il1-f228.google.com (mail-il1-f228.google.com [209.85.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693D2DEA9D
	for <brcm80211@lists.linux.dev>; Thu, 23 Oct 2025 10:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761216167; cv=none; b=D7cyZBXZq5Sk7YoXK55d2gHOIBgNz7FnxQyXAu2S7w29Oh1vY/TJnKNAN+sdBGrg7ITcMRLIBvFeGJIoEMnYYCcPIUYQgnCdHg2h8f4+ZlHIFOVnuSHRP2jZxZxqavmYByH0rQeypshP39z72KCuT/LxCfbz53r6hgiE/rZAEBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761216167; c=relaxed/simple;
	bh=n/xZM8n22nFHKZ6e6otWxRw0eIWjOIdonEm1GvVupwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ka5xKlptoxxf5hdvhlhv/n0fXJcnfKr4fTFapvPFhu2Sqf+vOuz32joaoEYsASsMXisrq8ZGNaWOUAP/YfQ4reJNPFaW9+X20jWBc4h1t3PGIqdjEwdwGJv5hMLmWX/81DGZ5sPPuKVyyePMY1njzo8hkHuSYoaIWiZgA/4HV/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XiDvn6Bo; arc=none smtp.client-ip=209.85.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XiDvn6Bo"
Received: by mail-il1-f228.google.com with SMTP id e9e14a558f8ab-430ccd45f19so8317815ab.1
        for <brcm80211@lists.linux.dev>; Thu, 23 Oct 2025 03:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216165; x=1761820965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AlVa3o8KCZev/Xc6g+qB46PrsHJwpamp8X7A9zs/vC4=;
        b=PchYB/9CQoafI9t24EXMxKcvaKsIH/Wf6VAPZ5+hqNO67uLMCrGxO58v3aUTfCnbqd
         gCu/NiHvbFbq3DI5bW1HQjqkuUVo6FcMWItsz8UmT1kwkxyJfyMhhA+d8DHyjqf6yrm2
         PpGiicGsY8Wxp+7PVN7XzuMyTYlImWQUc3iQg5dk3AEp3014a41jnCTh//NOqBEuW6su
         3QIaJhzIOLXj/io8H69zV5aKciMI0aqrBt+vfxaoZ0u0rexytYCiJ3xkPliyIlyVXvPt
         vToihImChAwCR+4P2LBKwa/ciXSETEvYizdrLpfxsnoJ6RTrRjxI1XYCZHrAJL/cgoZT
         1uEg==
X-Forwarded-Encrypted: i=1; AJvYcCULoc+ihxDQ6l6ZSTVLki8YCVLEAwNyVYDSwsph2P5t0eJb3wynoKk3MX1jMTbou9dkgX4mM+l/HME=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1PwCoTpm/6evqLTbiul0eKj1HOOCDjqab8VyLjpp5QPWMRduE
	jL08ACUBkk6wQaYhH/R/cEauoz2tlBUS/ZUdeZcGwZA8iDpeEHD9UNHm+p4zGq/NzQjO9QdIfja
	WEfVVRcP9sOO5NzbcfNht/A0nUh7ticlpUMqw6BD0MVvjzh1vGI3Cdt9G93UuRf4xDDaG1/9alR
	bE3Fro6VMrcGqcfcTliQacU1qYUIJXyklXKMYg+aiDR8+EzuiWercX0p5tdFQOh6Ho3s7wvjnZv
	Lle2+Tfs3q3e/aACWpjpw==
X-Gm-Gg: ASbGncuWGGD6r1qS303cj9DlsuokElCt7WCYuengR+frdBxnzmO/fD5wWq3cGb6IO1z
	MvHkV8BJHbOJfoiCMj253tO6p/5ANluxd90KRMRVZ71SJAIBDMmaL1Q2Sz1LLxvpfpBfFs5P1W9
	EUaEn2z2W5QrgouiGARcfpiZgN9kxoFnItH9yCpX0UugQJiucZNKQya5Fxr/iUyHbUiNFrQo3KQ
	d2oYd6ZySMQRxbcsnIWOb7RIJyvnhJCUX1OoQBDCAtHENxqzZun3dB2Lc8ZGIkgWwbOs89AyWSx
	lwHkbuNqXA7ecvnZhFomgdUReanDq7hzehvRBk+/0Iv9X4woeFiw+KsA7FHOiSU2WwZNbuuIiOm
	qU0oYNsEqy41OFkEJUyashhKB8GNKNVTVzblrOhhYT5v5HSb0SAH8a2ZsTyphkHyY9NePZQ95/h
	zspcLEMAyN4q25T/hd0VycoCk/hNHeo03VwSVX+2eu
X-Google-Smtp-Source: AGHT+IHNDPngoL5OAjjuuDyIQQsqcL/W6qUsThNTadf3itK9LRHyDQjTygSmV+l3Hnbiq+7c9jH7vGNcDt/U
X-Received: by 2002:a05:6e02:3e06:b0:42f:9501:69e with SMTP id e9e14a558f8ab-430c5295023mr300949385ab.20.1761216165272;
        Thu, 23 Oct 2025 03:42:45 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-124.dlp.protect.broadcom.com. [144.49.247.124])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-5abb4a51222sm122172173.1.2025.10.23.03.42.44
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Oct 2025 03:42:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47113dcc1e0so3902215e9.3
        for <brcm80211@lists.linux.dev>; Thu, 23 Oct 2025 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761216163; x=1761820963; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AlVa3o8KCZev/Xc6g+qB46PrsHJwpamp8X7A9zs/vC4=;
        b=XiDvn6Boj4nbaMKr/ot/vHnnVD3IHm72R0iRmkJEd7O75WRJHIZWuyVe77D3h3n+C9
         R0LuAZmP5mxpnJIHcekFs4xHiCa2230SEp2aupZtnrL1lWSjxHbdwHe+0wjomIH3p5yY
         SkMavKrqteZAqDrn5OFdArdQn5hcUfvtVNZzI=
X-Forwarded-Encrypted: i=1; AJvYcCWlKPXFnCz+j1SRpv2/UOHeOKvTct4G4t+1BgTedtuH+VTP4M1WWyuLM+VMfpK5YM36n2FTX2L649s=@lists.linux.dev
X-Received: by 2002:a05:600c:444d:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-471179202famr168147525e9.36.1761216163451;
        Thu, 23 Oct 2025 03:42:43 -0700 (PDT)
X-Received: by 2002:a05:600c:444d:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-471179202famr168147345e9.36.1761216163002;
        Thu, 23 Oct 2025 03:42:43 -0700 (PDT)
Received: from [10.176.3.11] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428dafesm87788295e9.6.2025.10.23.03.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 03:42:42 -0700 (PDT)
Message-ID: <6c5c0180-fc6b-421b-a2cf-3342cb6dc21b@broadcom.com>
Date: Thu, 23 Oct 2025 12:42:40 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Broadcom brcm80211 Displays WPA3 as WEP in OpenWRT
To: Stephen C Goodman <Stephen.C.Goodman2@outlook.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "brcm80211@lists.linux.dev" <brcm80211@lists.linux.dev>
References: <AS8P194MB1919C4BF0BF0BF222F65BA449DF2A@AS8P194MB1919.EURP194.PROD.OUTLOOK.COM>
 <AS8P194MB19190A3E9648FD04DCFD5A789DF2A@AS8P194MB1919.EURP194.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <AS8P194MB19190A3E9648FD04DCFD5A789DF2A@AS8P194MB1919.EURP194.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/21/2025 2:45 PM, Stephen C Goodman wrote:
> I would like to report a bug concerning the Broadcom bcm4366c0 driver, which affects most brcmfmac PCIe chips.
> Issue Details:
> Chipset: Broadcom bcm4366c0
> Environment: OpenWRT
> Kernel Version: 6.12.54
> mac80211 Version: 6.16 (backports)
> Description: While WPA3 is shown as SAE in OpenWRT LuCI, attempts to connect to the network or using a Wi-Fi analyzer reveal that it is actually operating as WEP. This discrepancy creates confusion and undermines security expectations.
> Steps to Reproduce:
> Use the Broadcom bcm4366c0 in an OpenWRT environment.
> Configure a wireless network with WPA3 security via LuCI.
> Attempt to connect to the network or perform a scan with a Wi-Fi analyzer.
> Observe that it identifies WPA3 as WEP.
> Please let me know if you require any additional information or logs to help diagnose this issue. Thank you for addressing this matter promptly.

Can you get radio info using the iw utility? Also please share the 
contents of /sys/kernel/debug/ieee80211/phy0/features and 
/sys/kernel/debug/ieee80211/phy0/fwcap.

Regards,
Arend
