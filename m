Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701EB290D80
	for <brcm80211@lists.linux.dev>; Wed,  4 Jun 2025 15:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049993; cv=none; b=kJOUXVhpGxD/Kez3ryCiV9njyDLXpSQJfhDAX8jvs6/AaF40p7ADD0YMkk9nLnCrDGmDb32GzVULn107iBnbV7YP1ACmy/hADisDqoVytjY8Bk4RYeelpPM3oZRHFxP1CxWO1QJSONvMySLrV6ujIKpLyOnOMewu6DmZ/sPkIoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049993; c=relaxed/simple;
	bh=Jkg4Sb1yi9z1Gb0NqBm9B5OPkPNevX1GB97mXAV7ACU=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=G7+u6QX55XQCEV+94xhgnPsko9ipkRGJolWsLY/N87KlkEaCo2uxgJxhOygoi/c6RN4NWOHdlq1YFwI4BrA7c09sRi085Ps9+R5bi4SYsTMgXHSA6O8xveBn/8+dB+w0AIgU+t73Xz5evJQeU4UPim0BWSzkzu3msDzLGNnWWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UZKe2+bW; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UZKe2+bW"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso3130162a12.0
        for <brcm80211@lists.linux.dev>; Wed, 04 Jun 2025 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749049990; x=1749654790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBhHEVAzu1DGyPLF74cPEKzyjc6HXkxZf9Iv8L5FMRk=;
        b=UZKe2+bWNIQCx6793ikfmkGZL6YHQ/X1NdznQQPTfYp/bqDsDLAixTk2Diw0tacBVY
         g9hHjObTPnFfbfxADpnk/MBRCCsKVzrg8ilR3M5BtxqVXjl1Rju4Tvb04J1l8BuqWXUZ
         zTxzZ86Fiy5ljYyhl4m6fuiYBAgJO1IqkyLbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749049990; x=1749654790;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBhHEVAzu1DGyPLF74cPEKzyjc6HXkxZf9Iv8L5FMRk=;
        b=gCARc+waVmKDxI2HDShC9omHFI1zy5579z6tGOVdAX3GhFdD5FMH8/HlmiI8atB4eA
         Yr5SUxiB3KtqLlqVtpuA8/YRxS/zNTPvf2T+Ep3Hkb1c4l+KEF5yZnHXgPeEAmf0yMSh
         jDRa71pT9hZZsA21qkjc0o28ewAd5zp81tHy9/szI21LKX1hFy4nNApToLvZ1eEO+6CU
         bjlxxuNsk7Zi4jTer9Ze7Wsz7Rh1WzZOykm3Ag1uix2kgV1cuctAEbPql26k1vdl7ZoY
         E0YLMOqrUdf3ndoZNGYKUs6i3xrRp0JOQUX9H1B46GNmiKWS/5RYl/x4/WHP1h/zS+SY
         ZDGA==
X-Forwarded-Encrypted: i=1; AJvYcCXSyBxH1ZRGZASuxfVPDZ+Rmw+h7AXFJknJm4UV7KJKHR11XdTeYSfDqf4/c15QMnvsLrK/fYsEylk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHBljePZzRi+Y8hsTo/jc2W5fOWIu5ql1cQJi6AARCc9MYD2Fl
	fotcN8GZZ4H5H4rEOw7Z2Joahd7kh7tMb8h/y085ccp0HEsNKm+E4hSXXHWWMOHMBA==
X-Gm-Gg: ASbGncvTWj4xm6QWm3z9qrM5rCUiPTwUS/hNZUOccf2rrE27DqMRbFIlqiU6+PZMwrz
	bdWGxb1M+X7IzWb6zq93uQA0NAGPv3qIB4ZI49G8m0QQj0w1PLvh6NjRNP/Q2D5wzCuH11POSgT
	unebxgCqQena+fNZ3GXUbB74KR5CktqQAkTl9QNZ6XlDtqDD5sHSUsyTPIcHmSXcMq7Kud79gU8
	oErkrFfjDQ7jc3xS4T/1lKWUMNIJKEo4E79WpToNbmfg7pBb+2qE2rMhTBxUsziQKFgaySPPLKc
	077AEKpE3Kv7jeZTswwf04GPptsKRtRx9jmxev7jNsxE5OGRHT6LJ0AfTP2kX+iGSlIh/TBT1gq
	fH6fjF9ZbE6Kcqw==
X-Google-Smtp-Source: AGHT+IEukyRcd660AX9n+HGL2NC0mjBwTJqwLfG0dG1xakPQAh2GRGT7eHe+PUNnEDYkyWaBQ/DC/A==
X-Received: by 2002:a17:906:d7c5:b0:ade:5fb:53bd with SMTP id a640c23a62f3a-ade05fb54c4mr25062566b.20.1749049989591;
        Wed, 04 Jun 2025 08:13:09 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad396ecsm1100347366b.139.2025.06.04.08.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 08:13:09 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>
Date: Wed, 04 Jun 2025 17:13:09 +0200
Message-ID: <1973b80d788.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <926c66d7-91a6-4555-9c2e-6557400eb5ba@oss.qualcomm.com>
References: <20250604085539.2803896-1-arend.vanspriel@broadcom.com>
 <20250604085539.2803896-2-arend.vanspriel@broadcom.com>
 <926c66d7-91a6-4555-9c2e-6557400eb5ba@oss.qualcomm.com>
User-Agent: AquaMail/1.55.1 (build: 105501552)
Subject: Re: [RFC 1/4] wifi: nl80211: allow drivers to support subset of NL80211_CMD_SET_BSS
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On June 4, 2025 4:06:51 PM Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:

> On 6/4/2025 1:55 AM, Arend van Spriel wrote:
>> @@ -2899,6 +2899,9 @@ enum nl80211_commands {
>> * APs Support". Drivers may set additional flags that they support
>> * in the kernel or device.
>> *
>> + * @NL80211_ATTR_BSS_PARAM: nested attribute used with %NL80211_CMD_GET_WIPHY
>> + * which indicates which BSS parameters can be modified.
>> + *
>
> Ideally this should describe what is contained in the nested attribute

Thanks, Jeff

Sure. Can add that info.

>
>
>> @@ -2996,6 +2996,40 @@ static int nl80211_send_wiphy(struct 
>> cfg80211_registered_device *rdev,
>> rdev->wiphy.ext_features))
>> goto nla_put_failure;
>>
>> + if (rdev->wiphy.bss_param_support) {
>> + struct nlattr *nested;
>> + u32 parsup = rdev->wiphy.bss_param_support;
>> +
>> + nested = nla_nest_start(msg, NL80211_ATTR_BSS_PARAM);
>> + if (!nested)
>> + goto nla_put_failure;
>> +
>> + if ((parsup & WIPHY_BSS_PARAM_CTS_PROT) &&
>> +    nla_put_flag(msg, NL80211_ATTR_BSS_CTS_PROT))
>> + goto nla_put_failure;
>> + if ((parsup & WIPHY_BSS_PARAM_SHORT_PREAMBLE) &&
>> +    nla_put_flag(msg, NL80211_ATTR_BSS_SHORT_PREAMBLE))
>> + goto nla_put_failure;
>> + if ((parsup & WIPHY_BSS_PARAM_SHORT_SLOT_TIME) &&
>> +    nla_put_flag(msg, NL80211_ATTR_BSS_SHORT_SLOT_TIME))
>> + goto nla_put_failure;
>> + if ((parsup & WIPHY_BSS_PARAM_BASIC_RATES) &&
>> +    nla_put_flag(msg, NL80211_ATTR_BSS_BASIC_RATES))
>> + goto nla_put_failure;
>> + if ((parsup & WIPHY_BSS_PARAM_AP_ISOLATE) &&
>> +    nla_put_flag(msg, NL80211_ATTR_AP_ISOLATE))
>> + goto nla_put_failure;
>> + if ((parsup & WIPHY_BSS_PARAM_HT_OPMODE) &&
>> +    nla_put_flag(msg, NL80211_ATTR_BSS_HT_OPMODE))
>> + goto nla_put_failure;
>> + if ((parsup & WIPHY_BSS_PARAM_P2P_CTWINDOW) &&
>> +    nla_put_flag(msg, NL80211_ATTR_P2P_CTWINDOW))
>> + goto nla_put_failure;
>> + if ((parsup & WIPHY_BSS_PARAM_P2P_OPPPS) &&
>> +    nla_put_flag(msg, NL80211_ATTR_P2P_OPPPS))
>> + goto nla_put_failure;
>> + nla_nest_end(msg, nested);
>
> I'm personally not a fan of (ab)using attribute ids in this manner. This means
> the receiver would need two different nla_parse policies, one that expects
> these to be NLA_FLAG when parsing the new attribute, along with the existing
> policy (such as the kernel's own nl80211_policy[NUM_NL80211_ATTR]) that is
> currently used when parsing the actual attributes.
>
> Does nl80211 have existing examples of using attribute ids like this?

Having two policies with the same attribute on receiving side would also 
rub my feathers. For the attributes used above we probably have other 
places where we use them from kernel to user-space. Clearly an oversight by 
me. Let me check.

Regards,
Arend
>


