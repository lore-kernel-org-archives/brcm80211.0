Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329D547ECFF
	for <brcm80211@lists.linux.dev>; Wed, 29 Jul 2026 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328143; cv=none; b=iYpGxlhhVPtMVsaGDg1MfcW3MVdyAYmWcOC0J+7xFVtOwd8v2N3Cd3sgq1rbfmsjP0ZwA9OHWMOd0ak0Si7Rv5kPndUDM8G4wejgkRpP4CBgcsKeDY/Rai1Mulv8Xisjw3sWZ65ez70vLjBz2HGbahQHmyHXk/47Q9zVBEgBZJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328143; c=relaxed/simple;
	bh=01EyYY3pZm/ZKYc7+9auWJ86XD/LO4jAF5sdui32lI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ay6aMEqyUtGd/o491uzJGmLfoeO90ZAzBN9bAsmTk7Hglvg/+svdtguOFyIPeQnO9DedfQbkUu9KDzBCGM/n+MAh2Hv2R6rMuiw1kyGwWDRYrrlm4m0PkZN5MrFQRc0+6L3BxVgXaN7UCuycZSKSt/EpkPCQ0hT3Og5sMGAQ+2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FSlfI9yD; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FSlfI9yD"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-848595b338cso1054886b3a.0
        for <brcm80211@lists.linux.dev>; Wed, 29 Jul 2026 05:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328132; x=1785932932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=80XIbOpgDfahtQfRx2y5PGslIsS8+OtcUMo3OPdSsEc=;
        b=KZtx+mobd0Doyom+Li4dRmiULegiJ4uyPO3UF6Hn1QgHvSvdRtaOnqz5d3FfXjIKuy
         +ZlayDBEZ8tyMi2Tc0TgUc1CuU+39HmpsLKHQyILgt6fIo7jY1vVS7wGWUMQHI3q3AIv
         QXskKNUU1tPTK9IpEXjNSumXfJn884WLlfkc+7/jIX8tjkwCBWWqeOYQtLkTUpwOZZxD
         OWXylA3SWnbqxRLmg47jv9IAyZF90taOpT6jF1R8YNkxxoCf6U7NkmL2lMRZsuVH34TZ
         vL8cHc/evQXEBEwdKXkEzHm+VEOxQSKut0N1t86l1yOLWxYNSv+4PcHel7wsUOQkhOcA
         Yk+w==
X-Forwarded-Encrypted: i=1; AHgh+RrB0oYvd1BSjsQgUy6affUJI5I+IDuWMbU7xVWwgcPr7kwfnzaWpUKEnAje4UPnaqf0LqjI4h2o/z8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5FBan7sZwaSXC0aqF+aoSm4/6hblQgzsolTwk9bbHkKc8Cxcq
	SNZpZLkp8i3XgLSV2OPwlXhaia11PAeAicFMZ1Y3/0S/8QgIBE//AuJS6GcfGc9HaiKwi+maCig
	TwT50p02sU08KRY7+MOAo/Is2++IvUuRQdy273SOvXMMWP1gh4lyba8oNs390hNUCyp2iBq5yOn
	vquSrXtoelT4GoCw2D8ok+QxI+R+OY+X2pRVaFj8BI4Dl2uEJP3H+0RPKYYmAAB9TaqxWPSOvdq
	Xc3Awq1EM3zmN3YeOYcnQ==
X-Gm-Gg: AR+sD108UGPoRi4Y8Ezdey9+SqT6WwDHdWGknd52cjINQ0a1CPFBsj7bpN6Lm5TTCR4
	gLMdGBlLzX1AH3GhjGXIciV6h1jU0eLjmtlRGXfvyTFB37/lmDGOw4VZBrWr/0MQH/bF+/9nIyT
	Yi5YA2+OOVCZ5rOXQkHYr9eUdfXpO7vg7hilVo/q7WH9tayvJAz60ceA8ZDZhM9uOv3YXYX1KTJ
	1B+uMGBLNIXVm3io6oCgXoCUZc3NIvAh8sE7h/uz5G1/hwo2oQa+kYx0Nv0PhdxIh0JSU90gzkV
	9OAKY5vdNl7j8tbeP3+oaydCfl4tToW2eKe81AzTgJKhhAE82O4RbbFl1LBgs5F9XEADLwwCCmA
	YVuE2M4hzcWH3I0dRhieviKZ3xcK97Tuabo9TLHfh5+43NM2bfD0+2kf66WIcfLcA5MBR9i1i1k
	LkMwcGu+79HW9v3nD5wxm1xLGxpECARLS46/qUr/4=
X-Received: by 2002:a05:6a20:12c7:b0:3c0:9c18:d5a3 with SMTP id adf61e73a8af0-3c8ba6957c6mr8168458637.64.1785328132046;
        Wed, 29 Jul 2026 05:28:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-31504d26185sm177476eec.23.2026.07.29.05.28.51
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:28:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15e82278cbso81069666b.2
        for <brcm80211@lists.linux.dev>; Wed, 29 Jul 2026 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785328129; x=1785932929; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80XIbOpgDfahtQfRx2y5PGslIsS8+OtcUMo3OPdSsEc=;
        b=FSlfI9yDJ6pHocHHsVf/wk4/4jY2aQ+lSbj2IkFXd/r8tUDrEedHBbL3g3NyRQbXnp
         pSX8i5Id6VQSXCI/4xSyZ8xaFM1+rjRqkRTCo0xSycsF7OVAddbqadMQqqL1Lm/2fxAG
         92fqwbGBi7g/brnupWYbBjX416/Ic9y6ALM8U=
X-Forwarded-Encrypted: i=1; AHgh+RriWGkJF0r7lSTIm9yERgnvbys5qRcYM7U3dITCakXfQcqfuF+kZOFxSx2euHOdccfAYJeke6Amueg=@lists.linux.dev
X-Received: by 2002:a17:906:99cb:b0:c1f:2b07:55aa with SMTP id a640c23a62f3a-c1f7218e1a2mr327886766b.45.1785328129591;
        Wed, 29 Jul 2026 05:28:49 -0700 (PDT)
X-Received: by 2002:a17:906:99cb:b0:c1f:2b07:55aa with SMTP id a640c23a62f3a-c1f7218e1a2mr327885066b.45.1785328129208;
        Wed, 29 Jul 2026 05:28:49 -0700 (PDT)
Received: from [10.176.3.215] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83fabc2fsm105876966b.50.2026.07.29.05.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:28:48 -0700 (PDT)
Message-ID: <c452116c-6215-4d62-b96b-72ae23a478e1@broadcom.com>
Date: Wed, 29 Jul 2026 14:28:48 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: configure SAE PWE method for external SAE
 AP
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260729053408.13715-1-bogdan.nicolae@gmail.com>
 <5cf57b2d-2bcc-481c-87bf-3a034d5f99be@broadcom.com>
 <CA+ORkNQntwC4k2arcngGdYB3mwsbJCkCRNTJRJ2GoRxjdGXLzA@mail.gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <CA+ORkNQntwC4k2arcngGdYB3mwsbJCkCRNTJRJ2GoRxjdGXLzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 29/07/2026 13:48, Bogdan Nicolae wrote:
>> On Wed, Jul 29, 2026, 04:48 Arend van Spriel 
>> <arend.vanspriel@broadcom.com <mailto:arend.vanspriel@broadcom.com>> wrote:
>> 
>>     On 29/07/2026 07:34, Bogdan Nicolae wrote:
>>      > When bringing up a WPA3-SAE SoftAP with external (user space)
>>     SAE, the
>>      > driver never told the firmware which SAE Password Element (PWE)
>>     method to
>>      > accept. The firmware was observed to corrupt its heap over time
>>     due to
>>      > this omission, leading to firmware trap (data abort in heap
>>     allocator).
>>      >
>>      > Parse the beacon IEs on start_ap() and set the extsae_pwe iovar
>>      > accordingly: 2 when the RSNX IE advertises H2E, 1 when an H2E-only
>>      > membership selector is present, 0 otherwise. This matches the
>>     behaviour
>>      > of the upstream/vendor driver and only applies to SAE-capable APs
>>     when
>>      > external SAE is supported.
>> 
>>     This makes sense, but may I ask what device do you have? Suspect it
>>     is a
>>     Cypress/Infineon chip. I could not find the iovar in our (Broadcom bca)
>>     code base so I suspect it is vendor specific.
> Hi Arend,
> 
> Indeed, this is a bcm43455 as found on Raspberry Pi SoCs.
Than we should only invoke the parse function for cyw vendor.

Regards,
Arend
