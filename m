Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE238331D
	for <brcm80211@lists.linux.dev>; Sun, 30 Aug 2026 09:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788081258; cv=none; b=Dfiq8jyo4LD8CbqXuKkk5HdG3MlRX0scLXJVLYIJdywCjFMco79/HEkttUPmq3t+ShoVPHxbnTKgwmn3DZNjGl4TuXGygCjoCNpu2O3jkcA1oT+x5erwVNqYLALaVD4xcMCrXgfpUNLx9qyTUECBWmQ3hVZmqAN3H2wzAPEHCIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788081258; c=relaxed/simple;
	bh=AqudLIf/iTthiXu19RutYAR2E41lgzFux0xXyzaNkSQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JawHgMGn/No796v3hW+jvy3LwGG5c8wQaNfiII7vdjy0llO6cn3cEzkix41xZ4y6fIcJUZwtltfPIn9bFNLw4l3Wxdcb2SKuL1Ru7FH92WXLlQ0Odq1MpdARtIJQuGIt2n4/PONW/C8SkN02dmB/jR0BRmEE7x7odJvp7enubUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=g/TFkBvZ; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="g/TFkBvZ"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so636610a91.0
        for <brcm80211@lists.linux.dev>; Sun, 30 Aug 2026 02:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788081256; x=1788686056;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=31p2j+a2MROOfrBQh9qdpbaoRZRWKQkLx8FBZclkpJw=;
        b=okD5ywij91YYzLUOeIUhE+2oeKRlu5FwqF1SdlOuF4WzKxbZh+tStmWzhO0V1tLphz
         HTwKmV7L8G6LBwrZkDuUgh7rhMw13bzyz5MA296DqHf4jrD3jg+Z4uzPxtHRMO6I+Rqg
         TkrsHkL9s7UlWQxj6hppQ4UQy0ZoyZCf3qDZ7L0RuvK0Ij/2G8mOBGeavjtgM4k3D7E5
         Wjj3IG0OmGmKTxr9A3ZnciP1wBgH+gVPuGtbkLKKpFEkryDhDO4FrgCvlwQvHrVieJsA
         8MxXE+clLLMGGxYk5XvPGq9E2mQ1uTW6yauP40V1FxXejsX5X/z6/TYPFhyOa9+73aKH
         KnYw==
X-Forwarded-Encrypted: i=1; AKwUvBy8t8Y5QwmdsZyx+B+1WazMd0tIsHbctH7BsjxfclKpgKfj2KQ2ouKgkZLMGCZtqNEeNPETMJB4qLs=@lists.linux.dev
X-Gm-Message-State: AFuF++lxlbn+jIrydPqrusTCRI5irS4eDD0V4FSfzV5SjgsJb9Dh5T7M
	mS1CfnseuDzHSkzYtm79OUWyImxd87CK6dCe4t8gpJ9jWwyUv5lhmIWIM8HwnLN4O1/b7ykmuDX
	HrWbYRQtV5TBnPiouhePfEbZU2pNxZeVgeRU62YKupt30lRp9NTeaxduUaDF5fWo6T0/zHobYqH
	FFQdK1a5vdvU+8+pAdZ5aGTBHHIYdDZ3rtHKOAGPA7xb7ga01eJXaItOOwR9sSKew2Ya6ZzUSXl
	oPFvHHfYDcwNB2x9ho=
X-Gm-Gg: AYBFou16oWpwMKugrAki/vWERyHFJxzAq3gOGUoQ/KUPfdYn3mUW+wyZSldwbQgH6tu
	6iy+yEgvZuQGcfXrWLSupsEvJQbLMBuWgBmUy8HNz5W7A0cY3TZTrEKxDqMFZl31ATUCgS1rtMl
	Dm7zRkAqXk2QA8vm1Emv1FnyDjXIEIxGpueFbIf+Ee0qMgRdNIC5u4Zqz6xjHCnKLAi5uJdYGsm
	f9BT7P+pl7Wof6RQIyBZwhBc6VjcDp4XJ8r4iL6+YQRS1tJiVsJe/0J2MEjjl8ZZeTvKu69q6jq
	2g6h+1R9DVa2VwTQgamdrbDgr+SPYiwf78WywqMh+2QDT9DvjciLIhpnuJEQP99huD+vuVDNZ46
	BUv4ah95AO4hHETlrzPsUuag+6z2r0r7ASTq0qc7kjS+RS8UjEJHXtAUXoURxRVlFbJl8k6Xne0
	h0PXqUKFr0O3qlum9L3ZNy+29fDYHh6ak+zoPjV/E=
X-Received: by 2002:a17:90b:1d0d:b0:398:9bd3:d6d1 with SMTP id 98e67ed59e1d1-398da6f3ec3mr940324a91.11.1788081255546;
        Sun, 30 Aug 2026 02:14:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-396b1832d88sm4627830a91.9.2026.08.30.02.14.15
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Aug 2026 02:14:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c18c775eso1365760a12.0
        for <brcm80211@lists.linux.dev>; Sun, 30 Aug 2026 02:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788081254; x=1788686054; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=31p2j+a2MROOfrBQh9qdpbaoRZRWKQkLx8FBZclkpJw=;
        b=g/TFkBvZvAXMTm0jMJqvXEiiAb//EvtxnzwSFquSSDheNrdumiKB+4EqCPEEqI7Fn9
         Sk1B0DB6j5hCufzpzI3rePDVdiQd5zWMvb6W5lEH+xq7ZX5NB9MV7ZB5JKRJ0PVcjjQR
         KYCxiqKhXyiC1lMxXDPi2weo7D2lsO+9APrdg=
X-Forwarded-Encrypted: i=1; AKwUvBxSXt+jhWvEmihYyTEy57fkCDWz4Tetnv+ZXfrJsXkbuE4Kb1gPIaxw9Fi5Ly34ye+ywvC07RImDqo=@lists.linux.dev
X-Received: by 2002:a17:90b:1a87:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-398da61d56dmr1054568a91.9.1788081253884;
        Sun, 30 Aug 2026 02:14:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1a87:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-398da61d56dmr1054548a91.9.1788081253416;
        Sun, 30 Aug 2026 02:14:13 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm29855331c88.4.2026.08.30.02.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 02:14:12 -0700 (PDT)
Message-ID: <8a866e2b-8802-4a8e-8421-2732da5f5c8f@broadcom.com>
Date: Sun, 30 Aug 2026 11:14:09 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] wifi: nl80211: add roam offload extended feature
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>, linux-wireless@vger.kernel.org
Cc: johannes.berg@intel.com, johannes@sipsolutions.net,
 hsin-hung.li@cypress.com, linux-kernel@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 wlan-kernel-dev-list@infineon.com, jeff.johnson@oss.qualcomm.com,
 Carella Chen <carella.chen@infineon.com>
References: <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-0-eeab4fda0f31@infineon.com>
 <20260821-upstream-wireless-next-main-jason-11r-support-v1-v5-1-eeab4fda0f31@infineon.com>
 <382c3dbb-ff32-4e62-9b79-c6e4cc6273ef@broadcom.com>
Content-Language: en-US
In-Reply-To: <382c3dbb-ff32-4e62-9b79-c6e4cc6273ef@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 22/08/2026 20:36, Arend van Spriel wrote:
> On 21/08/2026 09:56, Jason Huang wrote:
>> From: Carella Chen <carella.chen@infineon.com>
>>
>> Drivers can offload FT or OKC roaming without necessarily
>> advertising full 802.1X 4-way handshake offload. Add an extended
>> feature bit for that capability and allow PMK configuration when it is
>> present.
>>
>> This gives userspace a way to provide PMK or PMK-R0 material needed
>> by firmware roaming implementations while keeping the existing 4-way
>> handshake offload capability unchanged.
>>
>> Assisted-by: GitHub-Copilot-CLI:gpt-5.5
>> Signed-off-by: Carella Chen <carella.chen@infineon.com>
>> Signed-off-by: Jason Huang <jason.huang2@infineon.com>
>> ---
>>   include/uapi/linux/nl80211.h | 4 ++++
>>   net/wireless/nl80211.c       | 7 +++++--
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>

[...]

>> diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
>> index 44f2bad08670..15731440c57a 100644
>> --- a/net/wireless/nl80211.c
>> +++ b/net/wireless/nl80211.c
>> @@ -18434,6 +18434,7 @@ static int 
>> nl80211_set_multicast_to_unicast(struct sk_buff *skb,
>>   static int nl80211_set_pmk(struct sk_buff *skb, struct genl_info *info)
>>   {
>>       struct cfg80211_registered_device *rdev = info->user_ptr[0];
>> +    struct wiphy *wiphy = &rdev->wiphy;
>>       struct net_device *dev = info->user_ptr[1];
>>       struct wireless_dev *wdev = dev->ieee80211_ptr;
>>       struct cfg80211_pmk_conf pmk_conf = {};
>> @@ -18442,8 +18443,10 @@ static int nl80211_set_pmk(struct sk_buff 
>> *skb, struct genl_info *info)
>>           wdev->iftype != NL80211_IFTYPE_P2P_CLIENT)
>>           return -EOPNOTSUPP;
>> -    if (!wiphy_ext_feature_isset(&rdev->wiphy,
>> -                     NL80211_EXT_FEATURE_4WAY_HANDSHAKE_STA_1X))
>> +    if (!wiphy_ext_feature_isset(wiphy,
>> +                     NL80211_EXT_FEATURE_4WAY_HANDSHAKE_STA_1X) &&
>> +        !wiphy_ext_feature_isset(wiphy,
>> +                     NL80211_EXT_FEATURE_ROAM_OFFLOAD))
> 
> Ah. _FAST_ROAM_OFFLOAD is not longer than the other ext_feature checked 
> here.

Actually there is a checkpatch warning that line with the STA_1X check 
is 82 characters. So my suggestion please make it FAST_ROAMING instead 
of ROAM_OFFLOAD and swap the two checks to fix the checkpatch warning.

Regards,
Arend
